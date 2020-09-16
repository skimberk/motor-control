# motor-control

Fixed `Could not determine GDB version using command` error in STM32CubeIDE by installing `sudo apt install libncurses5`.

At first I was getting an error `failed to start gdb server`. I unplugged and replugged the ST-Link while in STM32CubeIDE and was prompted to upgrade the firmware. I upgraded the firmware and it started working.