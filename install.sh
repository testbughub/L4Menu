#!/bin/bash

if whiptail --title "Install" --yesno "This will install L4Menu on your device.\nContinue?" 10 40 2 ;
then
  SAMIP=$(whiptail --title "SAMBA" --inputbox "What is the server IP?")
  UNAME=$(whiptail --title "SAMBA" --inputbox "What is your username for Samba?" 10 40 3>&1 1>&2 2>&3)
  PWORD=$(whiptail --title "SAMBA" --passwordbox "What is your password for Samba?" 10 40 3>&1 1>&2 2>&3)
  sudo cp ./L4Menu.sh /home/pi/RetroPie/retropiemenu/
  sudo cp /home/pi/.emulationstation/gamelists/retropie/gamelist.xml /home/pi/.emulationstation/gamelists/retropie/gamelist.xml.bak
  sudo cp ./gamelist.xml /home/pi/.emulationstation/gamelists/retropie/
  cp ./icons/L4.png /home/pi/RetroPie/retropiemenu/icons/
  sudo mkdir /mnt/roms /mnt/skyscraper
  sudo mkdir /usr/share/L4Menu
  sudo cp ./CHANGEME/PATHS.txt /usr/share/L4Menu/
  echo $SAMIP > /usr/share/L4Menu/SERVER.txt
  echo username=$UNAME > /home/pi/.smbcredentials
  echo password=$PWORD >> /home/pi/.smbcredentials
  chmod 600 /home/pi/.smbcredentials
  whiptail --title "Install" --msgbox "Install complete!\nRestart ES to update the menu." 10 40 2
else
  exit 1
fi
