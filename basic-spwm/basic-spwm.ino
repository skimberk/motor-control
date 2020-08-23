#include <TimerOne.h>
#include <TimerThree.h>

unsigned int duties[] = {512, 612, 708, 796, 874, 938, 985, 1014, 1024, 1014, 985, 938, 874, 796, 708, 612, 512, 412, 316, 228, 150, 86, 39, 10, 0, 10, 39, 86, 150, 228, 316, 412};

void setup() {
  // put your setup code here, to run once:
  Timer1.initialize(20);
  Timer1.attachInterrupt(changePWM1);
  Timer1.pwm(3, 512);

  Timer3.initialize(20);
//  Timer3.attachInterrupt(changePWM3);
  Timer3.pwm(29, 512);
}

volatile unsigned int count = 0;

void changePWM1() {
  Timer1.setPwmDuty(3, duties[count]);
  count = (count + 1) % 32;
}

void loop() {
  // put your main code here, to run repeatedly:

}
