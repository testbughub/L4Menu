#!/bin/bash

RMOUNTPATH=$(cat /usr/share/L4Menu/PATHS.txt)
# SMOUNTPATH=$(cat /usr/share/L4Menu/PATHS.txt | tail -n3 | head -n1)

if whiptail --title "Uninstall" --yesno "This will uninstall L4Menu from your device.\nContinue?" 10 40 2 ;
then
  sudo rm -f /home/pi/RetroPie/retropiemenu/L4Menu.sh
  sudo rm -f /home/pi/RetroPie/retropiemenu/icons/L4.png
  sudo mv /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml.bak /opt/retropie/configs/all/emulationstation/gamelists/retropie/gamelist.xml
  sudo rm -f /home/pi/.smbcredentials
  sudo rm -rf /usr/share/L4Menu
  sudo umount $RMOUNTPATH
  sudo rm -rf /mnt/roms /mnt/skyscraper
  whiptail --title "Uninstall" --msgbox "Uninstall complete!" 10 40 2
  exit 0
else
  whiptail --title "Uninstall" --msgbox "Cancelled." 10 40 2
  exit 1
fi
