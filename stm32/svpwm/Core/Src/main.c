/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under Ultimate Liberty license
  * SLA0044, the "License"; You may not use this file except in compliance with
  * the License. You may obtain a copy of the License at:
  *                             www.st.com/SLA0044
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "math.h"
#include "stdio.h"
#include "inttypes.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

I2C_HandleTypeDef hi2c1;

TIM_HandleTypeDef htim1;

/* USER CODE BEGIN PV */

// I2C Values for AS5600
static const uint8_t AS5600_ADDR = 0x36 << 1; // Use 8-bit address
static const uint8_t RAW_ANGLE_REG = 0x0C;

static const float S_2_PI_3 = 2.0f * M_PI / 3.0f;
static const float S_1_SQRT3 = 1.0f / sqrtf(3.0f);
static const float S_2_SQRT3 = 2.0f / sqrtf(3.0f);
static const float S_SQRT3_2 = sqrt(3.0f) / 2.0f;
static const float SCALE_TO_ONE = 1.0f / (1.0f / (2.0f * sqrtf(3.0f)) + sqrtf(3.0f) / 2.0f);

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_TIM1_Init(void);
static void MX_I2C1_Init(void);
static void MX_ADC1_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

int _write(int32_t file, uint8_t *ptr, int32_t len) {
	/* Implement your write code here, this is used by puts and printf for example */
	int i = 0;
	for(i=0; i < len; i++) {
		ITM_SendChar((*ptr++));
	}
	return len;
}

int modeSelect = 0;

float theta = 0.0f;
float thetaAdd = 0.00002f;

uint16_t desiredRawAngle = 2000;
uint16_t lastRawAngle = 0;
int desiredVelocity = 0;
int velocity = 0;

uint16_t electricOffset = 35;
uint16_t electricRange = 585;
uint16_t electricAngle = 0;

uint32_t adcValues[2];

int dutyCycle = 500;
int period = 10000;

// In V
float V = 15.0f;

// TODO: Make this so you don't need to update it
float VConversionFactor = 15.0f * 150.0f / 10000.0f;

// In V
float Va = 0;
float Vb = 0;
float Vc = 0;

float Valpha = 0;
float Vbeta = 0;

// For converting from ADC value to mA
// ADC range is [0, 4095] which gets shifted
// to [-2048, 2047] to account for negative current.
// Current shunt resistance is 0.0005 ohms
// and current amplifier gain is 100 with range [-1.65, 1.65] volts
// So, V = 100 * 0.0005 * I
// So I = V / (100 * 0.0005)
// So for 1.65 volts, I = 1.65 / (100 * 0.0005) = 33 amps
float IConversionFactor = 33.0f / 2048.0f;

// In A
float Ia = 0;
float Ib = 0;
float Ic = 0;

float Ialpha = 0;
float Ibeta = 0;

// Sensorless stuff from this article:
// http://cas.ensmp.fr/~praly/Telechargement/Journaux/2010-IEEE_TPEL-Lee-Hong-Nam-Ortega-Praly-Astolfi.pdf

float R = 0.034f; // TODO
float L = 0.01f; // TODO
float psi = 0.01f; // TODO

float gamma_ = 1000.0f; // TODO

float yAlpha = 0;
float yBeta = 0;

float etaAlpha = 0;
float etaBeta = 0;

float psiSquared = 0;
float etaNormSquared = 0;

float xAlpha = 0;
float xBeta = 0;

float xDotAlpha = 0;
float xDotBeta = 0;

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim1_1) {
	float p;
	if (modeSelect == 0) {
		p = 0.0f;
	} else if (modeSelect == 1) {
		p = 100.0f * (desiredVelocity - velocity);

		if (desiredVelocity < 0) {
			p = -p;
		}

		if (p < 0.0f) {
			p = 0.0f;
		}
	}

	float multiplyBy = ((float)dutyCycle + p) * (1.0f + 12.5f * thetaAdd);
	int addTo = ((float)period - multiplyBy) / 2.0f;

	float third_sector = floorf(theta / S_2_PI_3);
	float third_sector_theta = theta - third_sector * S_2_PI_3;

	float x = cosf(third_sector_theta);
	float y = sinf(third_sector_theta);

	float a = SCALE_TO_ONE * (S_1_SQRT3 * y + x);
	float b = SCALE_TO_ONE * (S_2_SQRT3 * y);

	int a_time = a * multiplyBy;
	int b_time = b * multiplyBy;

	if (third_sector == 0) {
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, a_time + addTo);
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, b_time + addTo);
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, addTo);

		Va = a * VConversionFactor;
		Vb = b * VConversionFactor;
		Vc = 0;
	} else if (third_sector == 1) {
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, addTo);
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, a_time + addTo);
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, b_time + addTo);

		Va = 0;
		Vb = a * VConversionFactor;
		Vc = b * VConversionFactor;
	} else { // third_sector == 2
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, b_time + addTo);
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_2, addTo);
		__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_3, a_time + addTo);

		Va = b * VConversionFactor;
		Vb = 0;
		Vc = a * VConversionFactor;
	}

	if (modeSelect == 0) {
		theta += thetaAdd;
//		thetaAdd += 0.0000002f;

		if (theta >= 2.0f * M_PI) {
			theta -= 2.0f * M_PI;
		}
	}
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_TIM1_Init();
  MX_I2C1_Init();
  MX_ADC1_Init();
  /* USER CODE BEGIN 2 */
  __HAL_TIM_ENABLE_IT(&htim1, TIM_IT_UPDATE);

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_1);

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_2);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_2);

  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_3);
  HAL_TIMEx_PWMN_Start(&htim1, TIM_CHANNEL_3);

  if (HAL_ADC_Start_DMA(&hadc1, adcValues, 2) != HAL_OK) {
	  printf("Error ADC start\n");
  }

  HAL_StatusTypeDef ret;
  uint8_t buf[12];

  if (modeSelect == 1) {
	  buf[0] = RAW_ANGLE_REG;
	  ret = HAL_I2C_Master_Transmit(&hi2c1, AS5600_ADDR, buf, 1, 1000);
	  if (ret == HAL_BUSY) {
		  printf("Busy Tx\n");
	  } else if (ret == HAL_ERROR) {
		  printf("Error Tx\n");
	  } else {
		  printf("Success Tx\n");
	  }
  }


  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
	  if (modeSelect == 1) {
		  ret = HAL_I2C_Master_Receive(&hi2c1, AS5600_ADDR, buf, 2, 1000);
		  if (ret != HAL_OK) {
			  printf("Error Rx\n");
		  } else {
			  uint16_t rawAngle = (((uint16_t) buf[0]) << 8) + buf[1];
//			  printf("Read I2C %u\n", rawAngle);

			  if (lastRawAngle > 3995 && rawAngle < 100) {
				  velocity = 4095 - ((int)lastRawAngle) + ((int)rawAngle);
			  } else {
				  velocity = ((int)rawAngle) - ((int)lastRawAngle);
			  }

//			  printf("Velocity %d\n", velocity);

			  lastRawAngle = rawAngle;

			  if (electricOffset > rawAngle) {
				  electricAngle = electricRange - electricOffset + rawAngle;
			  } else {
				  electricAngle = (rawAngle - electricOffset) % electricRange;
			  }

//			  printf("Electric angle %u\n", electricAngle);

//			  desiredVelocity = 20;
			  desiredVelocity = ((int)desiredRawAngle - (int)rawAngle) / 5;

			  if (desiredVelocity > 20) {
			  	desiredVelocity = 20;
			  } else if (desiredVelocity < -20) {
			  	desiredVelocity = -20;
			  }

			  if (desiredVelocity > 0) {
				  theta = 2.0f * M_PI * ((electricAngle + electricRange / 4) % electricRange) / (1.0f * electricRange);
			  } else {
				  theta = 2.0f * M_PI * ((electricAngle + 3 * electricRange / 4) % electricRange) / (1.0f * electricRange);
			  }
		  }
	  }

	  Ia = ((float)adcValues[0] - 4096 / 2) * IConversionFactor;
	  Ib = ((float)adcValues[1] - 4096 / 2) * IConversionFactor;
	  Ic = -(Ia + Ib);

	  Ialpha = Ia - 0.5 * Ib - 0.5 * Ic;
	  Ibeta = S_SQRT3_2 * Ib - S_SQRT3_2 * Ic;

	  Valpha = Va - 0.5 * Vb - 0.5 * Vc;
	  Vbeta = S_SQRT3_2 * Vb - S_SQRT3_2 * Vc;

	  yAlpha = -R * Ialpha + Valpha;
	  yBeta = -R * Ibeta + Vbeta;

	  etaAlpha = xAlpha - L * Ialpha;
	  etaBeta = xBeta - L * Ibeta;

	  psiSquared = psi * psi;
	  etaNormSquared = etaAlpha * etaAlpha + etaBeta * etaBeta;

	  xDotAlpha = yAlpha + 0.5 * gamma_ * etaAlpha * (psiSquared - etaNormSquared);
	  xDotBeta = yBeta + 0.5 * gamma_ * etaBeta * (psiSquared - etaNormSquared);

//	  HAL_Delay(250);

//	  theta += 0.01;
//
//	  if (theta >= 2.0f * M_PI) {
//		  theta -= 2.0f * M_PI;
//	  }
//
//	  HAL_Delay(10);
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSEPredivValue = RCC_HSE_PREDIV_DIV1;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL9;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_ADC;
  PeriphClkInit.AdcClockSelection = RCC_ADCPCLK2_DIV6;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief ADC1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_ADC1_Init(void)
{

  /* USER CODE BEGIN ADC1_Init 0 */

  /* USER CODE END ADC1_Init 0 */

  ADC_ChannelConfTypeDef sConfig = {0};

  /* USER CODE BEGIN ADC1_Init 1 */

  /* USER CODE END ADC1_Init 1 */
  /** Common config
  */
  hadc1.Instance = ADC1;
  hadc1.Init.ScanConvMode = ADC_SCAN_ENABLE;
  hadc1.Init.ContinuousConvMode = ENABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConv = ADC_SOFTWARE_START;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 2;
  if (HAL_ADC_Init(&hadc1) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_1;
  sConfig.Rank = ADC_REGULAR_RANK_1;
  sConfig.SamplingTime = ADC_SAMPLETIME_41CYCLES_5;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure Regular Channel
  */
  sConfig.Channel = ADC_CHANNEL_2;
  sConfig.Rank = ADC_REGULAR_RANK_2;
  if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN ADC1_Init 2 */

  /* USER CODE END ADC1_Init 2 */

}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 400000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief TIM1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM1_Init(void)
{

  /* USER CODE BEGIN TIM1_Init 0 */

  /* USER CODE END TIM1_Init 0 */

  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  /* USER CODE BEGIN TIM1_Init 1 */

  /* USER CODE END TIM1_Init 1 */
  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 0;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 10000;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  if (HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_TIM_PWM_Init(&htim1) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 500;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.Pulse = 250;
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_2) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.Pulse = 750;
  if (HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_3) != HAL_OK)
  {
    Error_Handler();
  }
  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  if (HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM1_Init 2 */

  /* USER CODE END TIM1_Init 2 */
  HAL_TIM_MspPostInit(&htim1);

}

/**
  * Enable DMA controller clock
  */
static void MX_DMA_Init(void)
{

  /* DMA controller clock enable */
  __HAL_RCC_DMA1_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel1_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
