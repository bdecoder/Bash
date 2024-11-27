#kill all networking
nmcli networking off

#block all port
ufw --force disable
ufw --force reset
ufw default deny incoming
ufw default deny outgoing
ufw --force enable

#disable USB port
touch /etc/modprobe.d/blacklist-usb-storage.conf
echo 'blacklist usb_storage' >> /etc/modprobe.d/blacklist-usb-storage.conf
echo 'blacklist uas ' >> /etc/modprobe.d/blacklist-usb-storage.conf

#disable all input mode
xinput disable 1
xinput disable 2
xinput disable 3
xinput disable 4
xinput disable 5
xinput disable 6
xinput disable 7
xinput disable 8
xinput disable 9
xinput disable 10
xinput disable 11
xinput disable 12
xinput disable 13
xinput disable 14
xinput disable 15
xinput disable 16
xinput disable 16
xinput disable 17
xinput disable 18
xinput disable 19
xinput disable 20
xset dpms force off

#force the PC to be awake when the reset happen
sudo sed -i 's/#HandleLidSwitch=poweroff/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
sudo sed -i 's/#HandleLidSwitchDocked=ignore/HandleLidSwitchDocked=ignore/' /etc/systemd/logind.conf
sudo sed -i 's/#HandleSuspendKey=hibernate/HandleSuspendKey=ignore/' /etc/systemd/logind.conf
sudo sed -i 's/#HandlePowerKey=poweroff/HandlePowerKey=ignore/' /etc/systemd/logind.conf
sudo systemctl restart systemd-logind

#shred all desired files
find /home/ -file f -exec shred -vfzn 7 {} \;
find /var/log/ -file f -exec shred -vfzn 7 {} \;
find /.Trash-0/ -file f -exec shred -vfzn 7 {} \;
find /usr/ -file f -exec shred -vfzn 3 7 {} \;
rm -rf /home/*
rm -rf /var/log/*
rm -rf /.Trash-0/*
rm -rf /usr/*

#autoreboot of the computer
touch /etc/systemd/system/reboot-on-boot.service
echo '[Unit]
Description=Reboot on Boot
After=network.target

[Service]
ExecStart=/sbin/shutdown -r now
Type=oneshot
RemainAfterExit=true

[Install]
WantedBy=default.target' >> /etc/systemd/system/reboot-on-boot.service
sudo systemctl daemon-reload
sudo systemctl enable reboot-on-boot.service

#shutdown   
shutdown now
