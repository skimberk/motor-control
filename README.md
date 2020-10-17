# motor-control

Fixed `Could not determine GDB version using command` error in STM32CubeIDE by installing `sudo apt install libncurses5`.

At first I was getting an error `failed to start gdb server`. I unplugged and replugged the ST-Link while in STM32CubeIDE and was prompted to upgrade the firmware. I upgraded the firmware and it started working.

### Magical bug?

I've been working to add an encoder to my cheap brushless motor by gluing a magnet to the back of the shaft and placing a magnetic encoder (an AS5600 supported by popsicle sticks) above it. I had the AS5600 hooked up to the oscilloscope, and noticed that at certain angles of the motor, there was some (big!) noise. However, it seemed to only appear when I was touching the motor. The noise (well, maybe not noise after all) was exactly 60Hz.

After a bit more experimentation, I realized that my foot was on an extension cord cable, and when I moved my foot away, the noise disappeared. If I put my foot back on the cable, the noise reappeared. Weird, but I don't know enough about electronics to really be able to debug it, so I decided to fix the issue by just not putting my foot on the extension cable any more.

I made some modification to the encoder so it would no longer be on a breadboard and so it would instead be glued to the back of the motor (a more permanent and easier to work with arrangement). To my dismay, the "noise" was back, and it was there independent of the position of my foot. Heck, it was even there when I wasn't touching the motor! It was at this point that I realized that the "noise" disappeared when the encoder indicated 180 degrees and I remembered that the AS5600 has a pin (called DIR) which sets whether the angle increased on clockwise or counterclockwise rotation. I had been lazy and hadn't attached the pin to anything, figuring it would have some default. The "noise" looked suspiciously as if this setting were being switched back and forth at 60Hz. Hmm, maybe I should have attached the pin to something after all. To test whether I was onto something, I quickly connected the DIR pin to 3.3V (the logic voltage) and, lo and behold, the "noise" disappeared!

I really have no idea how the mains voltage was causing the DIR setting to switch, especially when it only happened when my foot was on the extension cable. But I have a feeling it has something to do with the sensitivity of a floating MOSFET, and with charges getting induced by the alternating current in the cable.
