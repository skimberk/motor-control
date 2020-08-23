void setup() {
  // put your setup code here, to run once:
  //SIM_SCGC6|=0x03000000; //enable FTM0 and FTM0 module clock
  //SIM_SCGC5=SIM_SCGC5|0x3E00; //enable port A/B/C/D/E clock
  FTM0_SC = 0x00;
  //FTM0_CONF=0xC0; //set up BDM in 11
  //FTM0_FMS=0x00; //clear the WPEN so that WPDIS is set in FTM0_MODE reg
  //FTM0_MODE|=0x05; //enable write the FTM CnV register
  FTM0_MOD = 1000;
  FTM0_C0SC = FTM_CSC_MSB | FTM_CSC_ELSB; //High-Low_high for combined and complementary mode
  FTM0_C1SC = FTM_CSC_MSB | FTM_CSC_ELSB;
  FTM0_COMBINE = FTM_COMBINE_COMP0 | FTM_COMBINE_COMBINE0; //complementary and combined mode for CH0&CH1
  //FTM0_COMBINE|=0x1010; // dead timer insertion enabled in complementary mode //for CH0&CH1 of FTM0
  //FTM0_DEADTIME=0x1F; //deattime is 31 system clock cycles
  FTM0_C1V = 750;
  FTM0_C0V = 250;
  //FTM0_CNTIN=0x00;
  FTM0_SC = FTM_SC_CLKS(1); //PWM edge_alignment, system clock driving, dividing by 1

  CORE_PIN22_CONFIG = PORT_PCR_MUX(4) | PORT_PCR_DSE | PORT_PCR_SRE;
  CORE_PIN23_CONFIG = PORT_PCR_MUX(4) | PORT_PCR_DSE | PORT_PCR_SRE;
}

void loop() {
  // put your main code here, to run repeatedly:

}
