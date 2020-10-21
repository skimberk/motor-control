# motor-control

Fixed `Could not determine GDB version using command` error in STM32CubeIDE by installing `sudo apt install libncurses5`.

At first I was getting an error `failed to start gdb server`. I unplugged and replugged the ST-Link while in STM32CubeIDE and was prompted to upgrade the firmware. I upgraded the firmware and it started working.

### Getting SWV Trace to work with ST-Link V2 chinese clone

Summary: I had to solder a piece of magnet wire to one of the pins on the chip of the ST-Link so that I could connect it to the `TRACESWO` pin on my STM32F103 Blue Pill. Here's the tutorial I (more or less) followed: https://lujji.github.io/blog/stlink-clone-trace/

After a lot of flailing (and thinking that maybe my version of STM32CubeIDE was just broken), I finally got SWV Trace working. It turns out that it requires having a pin on the ST-Link connected to the SWO pin on the STM32. For some reason, though, this pin isn't one of the pins that's normally accessible on the chinese ST-Link clones, so I had to solder on a piece of magnet wire. It works now!

1. Take apart the ST-Link. I found that if I held the metal case and pushed on the USB connector, the PCB (which is attached to the USB connector) popped out pretty easily.

2. Solder a length of magnet wire (just thin copper wire with enamel insulation) onto pin 31 (AKA `PA10`) of the chip inside the ST-Link. See tutorial for more info: https://lujji.github.io/blog/stlink-clone-trace/ The chip in my ST-Link is a CKS32F103C8T6, which appears to be a clone of the original STM32F103C8T6. It worked for me, though, so having a cloned chip wasn't a problem.

3. Solder a piece of 22 gauge solid copper wire onto the end of the magnet wire for breadboarding, then put the metal case back onto the ST-Link. I also superglued the magnet wire onto the PCB to (hopefully) prevent it from getting pulled off the trace and cut a little groove into the plastic pin holder thing (?) for the magnet wire to pass through when the case is back on.

4. Enable SWV in STM32CubeIDE. Open the `Debug Configuations...` under the Debug icon (the weird little insect/tick looking thing). In the `Debugger` tab, enable `Serial Wire Viewer (SWV)` and make sure the `Core Clock` is set to your system clock (which you can find in STM32CubeIDE under `SYSCLK`). 

5. In the Debugger perspective, click on `Window -> Show View -> SWV -> SWV Data Trace` (and `SWV Data Trace Timeline Graph`) to be able to view the SWV output.

6. Enable the `SYS_JTDO-TRACESWO` pin on your microcontroller (on my STM32F103C8 this was on pin `PB3`) and set the `Debug` method under `SYS` (which is itself under `System Core` in STM32CubeMX) to `Trace Asynchronous Sw`.

7. Run the generated code (in debug mode, by pressing the little bug icon) on your microcontroller. Make sure the `TRACESWO` on your microntroller (`PB3` in my case) is connected to the new pin you soldered onto your ST-Link. While the debugger is paused on the first breakpoint (I wasn't able to get this working otherwise) bring up the SWV settings by clicking on the wrench icon under the `SWV Data Trace` tab. Under `ITM Stimulus Ports`, enable pin 0. Start tracing by clicking the red circle.

Some of these steps might not be necessary, but it's what I ended up doing to get SWV working. I also redirected `printf` output to the `SWV Data Trace` console by adding the following code to my `main.c`:

```
// Just make sure stdio.h is included
#include "stdio.h"

// ... some other code in between

int _write(int32_t file, uint8_t *ptr, int32_t len) {
	/* Implement your write code here, this is used by puts and printf for example */
	int i = 0;
	for(i=0; i < len; i++) {
		ITM_SendChar((*ptr++));
	}
	return len;
}
```

### Getting I2C working (just use pullup resistors)

I was having difficulties getting I2C to work on my STM32 (using STM32CubeIDE and STM32CubeMX). `HAL_I2C_Master_Transmit` would always either return `HAL_BUSY` or `HAL_ERROR`. When I connected my oscilloscope to `SCL` it would always return `HAL_BUSY`, whereas when it wasn't connected to anything it would return `HAL_ERROR`. This, along with the fact that the pin appeared to always be low on the oscilloscope, was a little suspicious. I added some 2.2K pullup resistors to both `SCL` and `SDA` and now it's working fine!

### Magical bug?

I've been working to add an encoder to my cheap brushless motor by gluing a magnet to the back of the shaft and placing a magnetic encoder (an AS5600 supported by popsicle sticks) above it. I had the AS5600 hooked up to the oscilloscope, and noticed that at certain angles of the motor, there was some (big!) noise. However, it seemed to only appear when I was touching the motor. The noise (well, maybe not noise after all) was exactly 60Hz.

After a bit more experimentation, I realized that my foot was on an extension cord cable, and when I moved my foot away, the noise disappeared. If I put my foot back on the cable, the noise reappeared. Weird, but I don't know enough about electronics to really be able to debug it, so I decided to fix the issue by just not putting my foot on the extension cable any more.

I made some modification to the encoder so it would no longer be on a breadboard and so it would instead be glued to the back of the motor (a more permanent and easier to work with arrangement). To my dismay, the "noise" was back, and it was there independent of the position of my foot. Heck, it was even there when I wasn't touching the motor! It was at this point that I realized that the "noise" disappeared when the encoder indicated 180 degrees and I remembered that the AS5600 has a pin (called DIR) which sets whether the angle increased on clockwise or counterclockwise rotation. I had been lazy and hadn't attached the pin to anything, figuring it would have some default. The "noise" looked suspiciously as if this setting were being switched back and forth at 60Hz. Hmm, maybe I should have attached the pin to something after all. To test whether I was onto something, I quickly connected the DIR pin to 3.3V (the logic voltage) and, lo and behold, the "noise" disappeared!

I really have no idea how the mains voltage was causing the DIR setting to switch, especially when it only happened when my foot was on the extension cable. But I have a feeling it has something to do with the sensitivity of a floating MOSFET, and with charges getting induced by the alternating current in the cable.

### STM32CubeIDE install location (on Ubuntu)

I was having a hard time figuring out where STM32CubeIDE was installed so that I could run it as `sudo` and update it. I found it in `/opt/st/`.
