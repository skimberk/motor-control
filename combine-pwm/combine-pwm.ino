void ftm0_isr(void) {
  FTM0_SC &= ~FTM_SC_TOF;

  //FTM0_C5V = (duties[count] * 1200) >> 10;
  //FTM0_C6V = (duties[(count + 11) % 32] * 1200) >> 10;
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

void setup() {
  // put your setup code here, to run once:
  FTM0_SC = 0;
  FTM0_MOD = 1200;
  FTM0_SC = FTM_SC_CLKS(1) | 0;

  //FTM0_SC |= FTM_SC_TOIE;
  //NVIC_ENABLE_IRQ(IRQ_FTM0);

  //FTM0_DEADTIME = FTM_DEADTIME_DTVAL(16);
  FTM0_COMBINE = FTM_COMBINE_COMP0 | FTM_COMBINE_DTEN0 | FTM_COMBINE_COMBINE0;

  FTM0_C0SC = FTM_CSC_MSB | FTM_CSC_ELSB;
  FTM0_C0V = 200;
  CORE_PIN22_CONFIG = PORT_PCR_MUX(4) | PORT_PCR_DSE | PORT_PCR_SRE;

  FTM0_C1SC = FTM_CSC_MSB | FTM_CSC_ELSB;
  FTM0_C1V = 800;
  CORE_PIN23_CONFIG = PORT_PCR_MUX(4) | PORT_PCR_DSE | PORT_PCR_SRE;
}

void loop() {
  // put your main code here, to run repeatedly:
}
