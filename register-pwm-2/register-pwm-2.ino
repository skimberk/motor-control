unsigned int duties[] = {512, 612, 708, 796, 874, 938, 985, 1014, 1024, 1014, 985, 938, 874, 796, 708, 612, 512, 412, 316, 228, 150, 86, 39, 10, 0, 10, 39, 86, 150, 228, 316, 412};
volatile unsigned int count = 0;

void ftm0_isr(void) {
  FTM0_SC &= ~FTM_SC_TOF;

  FTM0_C0V = (duties[count] * 1200) >> 10;
  FTM0_C2V = (duties[(count + 11) % 32] * 1200) >> 10;
  count = (count + 1) % 32;
}

void setup() {
  // put your setup code here, to run once:
  FTM0_SC = 0;
  FTM0_MOD = 1200;
  FTM0_SC = FTM_SC_CLKS(1) | 0;

  FTM0_SC |= FTM_SC_TOIE;
  NVIC_ENABLE_IRQ(IRQ_FTM0);

  //FTM0_C5SC = 0b000010100; // Output compare
  FTM0_C0V = 300;
  CORE_PIN22_CONFIG = PORT_PCR_MUX(4) | PORT_PCR_DSE | PORT_PCR_SRE;

  FTM0_C2V = 300;
  CORE_PIN9_CONFIG = PORT_PCR_MUX(4) | PORT_PCR_DSE | PORT_PCR_SRE;
}

void loop() {
  // put your main code here, to run repeatedly:

}
