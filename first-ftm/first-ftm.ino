volatile unsigned long ticks = 0;

void ftm3_isr(void) {
  FTM3_SC &= ~FTM_SC_TOF;  // reset interrupt
  ticks++;
}

void setup() {
  Serial.begin(9600);
  while (!Serial);

  analogWriteFrequency(2, 50000);

  NVIC_ENABLE_IRQ(IRQ_FTM3);
  FTM3_SC = FTM_SC_CLKS(1) | FTM_SC_PS(0) | FTM_SC_TOF | FTM_SC_TOIE;

  analogWrite(2, 128);
}

void loop() {
  Serial.println(ticks);
  delay(1000);
}
