# OPSEC
This category will focus on OPSEC scripts, which have a range of goals, all aimed at ensuring the security of your computer against potential attackers.

## lockdown.sh
lockdown.sh allows you to totally "kill" a computer.

When running this script, several things will happen: 
1) Turning off all network communication
2) Blocking of all ports
3) Disabling the USB ports for all the next during reboot
4) disabling any mode of communication with the machine
5) Disable the sleep function
6) wipe all important files (4 rounds)
7) Setting up an automatic restart when booting the computer
8) Computer shutdown

To install this script, you will need to run this command:

`sudo apt install shred xinput xset ufw nmcli -y`

## USBshutdown.sh
The purpose of this script is to execute a command when removing a USB key from your computer.

To do this, the script takes place in several phases:
1) Scan the devices connected to your computer. During this phase, you must unplug the key that will serve as your "security key"
2) The script will ask you to plug in the USB stick. He will then recover his PID as well as his VID
3) The script will check every 0.1 seconds that the key is plugged in. If so, it will display the message "USB flash drive still connected". If it doesn't, it will turn off the computer.

TIPS:

-You can modify the command that will be executed if the key disconnects by modifying line 55

-The terminal must remain open. The scrit will turn off if you close it.

-It is advisable to use a key with a PID and a non-common VID (not like abcd:1234)
