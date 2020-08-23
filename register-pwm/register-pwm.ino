unsigned int duties[] = {512, 612, 708, 796, 874, 938, 985, 1014, 1024, 1014, 985, 938, 874, 796, 708, 612, 512, 412, 316, 228, 150, 86, 39, 10, 0, 10, 39, 86, 150, 228, 316, 412};
volatile unsigned int count = 0;

volatile unsigned long ticks = 0;

void ftm0_isr(void) {
  FTM0_SC &= ~FTM_SC_TOF;  // reset interrupt
  ticks++;

  //FTM0_C5V = duties[count] * 5;
  //FTM0_C6V = duties[count] * 5;
  //count = (count + 1) % 32;
}

// FTM0_CH0_PIN 22
// FTM0_CH1_PIN 23
// FTM0_CH2_PIN  9
// FTM0_CH3_PIN 10
// FTM0_CH4_PIN  6
// FTM0_CH5_PIN 20
// FTM0_CH6_PIN 21
// FTM0_CH7_PIN  5

//CH5 20
//CH6 21
//CH0 22

void setup() {
  Serial.begin(9600);
  while (!Serial);

  NVIC_ENABLE_IRQ(IRQ_FTM0);
  FTM0_SC = FTM_SC_CLKS(1) | FTM_SC_PS(0) | FTM_SC_TOIE;
  FTM0_MOD = 1000;

  FTM0_C5SC = 0b101001;
  FTM0_C5V = 1000;

  //FTM0_C6SC = 0b101001;
  //FTM0_C6V = 1000;

  CORE_PIN20_CONFIG = PORT_PCR_MUX(4);
  //CORE_PIN21_CONFIG = PORT_PCR_MUX(4);
}

void loop() {
  Serial.println(ticks);
  delay(1000);
}
