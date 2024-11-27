# OPSEC
This category will focus on OPSEC scripts, which have a range of goals, all aimed at ensuring the security of your computer against potential attackers.

## Wipe.sh
Wipe.sh allows you to totally "kill" a computer.

When running this script, several things will happen: 
1) Turning off all network communication
2) Blocking of all ports
3) Disabling the USB ports during reboot
4) disabling any mode of communication with the machine
5) Disable the sleep function
6) wipe all important files (4 rounds)
7) Setting up an automatic restart when booting the computer
8) Computer shutdown

To install this script, you will need to run this command:

`sudo apt install shred xinput xset ufw nmcli -y`
