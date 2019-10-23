#!/bin/bash

UNAME=$(cat ./CHANGEME/AUTH.txt | head -n2 | tail -n1)
PASS=$(cat ./CHANGEME/AUTH.txt | head -n4 | tail -n1)

if whiptail --title "Install" --yesno "This will install L4Menu on your device.\nContinue?" 10 50 2 ;
then
  sudo cp ./L4Menu.sh /home/pi/RetroPie/retropiemenu/
  sudo cp /home/pi/.emulationstation/gamelists/retropie/gamelist.xml /home/pi/.emulationstation/gamelists/retropie/gamelist.xml.bak
  sudo cp ./gamelist.xml /home/pi/.emulationstation/gamelists/retropie/
  cp ./icons/L4.png /home/pi/RetroPie/retropiemenu/icons/
  sudo mkdir /mnt/roms /mnt/skyscraper
  sudo mkdir /usr/share/L4Menu
  sudo cp ./CHANGEME/PATHS.txt /usr/share/L4Menu/
  sudo cp ./CHANGEME/SERVER.txt /usr/share/L4Menu/
  sudo cp ./.paths /usr/share/L4Menu/
  echo "username=$UNAME" > /home/pi/.smbcredentials
  echo "password=$PASS" >> /home/pi/.smbcredentials
  chmod 600 /home/pi/.smbcredentials
  whiptail --title "Install" --msgbox "Install complete!\nRestart ES to update the menu." 10 40 2
else
  whiptail --title "Install" --msgbox "Cancelled." 10 40 2
  exit 1
fi

exit 0
