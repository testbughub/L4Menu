#!/bin/bash

if whiptail --title "Install" --yesno "This will install L4Menu on your device.\nContinue?" 10 40 2 ;
then
  SAMIP=$(whiptail --title "SAMBA" --inputbox "What is the server IP?" 10 40 3>&1 1>&2 2>&3)
  if [[ $SAMIP -lt 10 ]]; then
    whiptail --title "SAMBA" --msgbox "Invalid IP address" 10 40 2
    exit 1
  fi
  UNAME=$(whiptail --title "SAMBA" --inputbox "What is your username for Samba?" 10 40 3>&1 1>&2 2>&3)
  PWORD=$(whiptail --title "SAMBA" --passwordbox "What is your password for Samba?" 10 40 3>&1 1>&2 2>&3)
  cp ./L4Menu.sh /home/pi/RetroPie/retropiemenu/
  cp /home/pi/.emulationstation/gamelists/retropie/gamelist.xml /home/pi/.emulationstation/gamelists/retropie/gamelist.xml.bak
  cp ./gamelist.xml /home/pi/.emulationstation/gamelists/retropie/
  cp -p ./icons/L4.png /home/pi/RetroPie/retropiemenu/icons/
  mkdir /mnt/roms /mnt/skyscraper
  mkdir /usr/share/L4Menu
  touch /usr/share/L4Menu/PATHS.txt
  echo "/mnt/roms" > /usr/share/L4Menu/PATHS.txt
  touch /usr/share/L4Menu/SERVER.txt
  echo $SAMIP > /usr/share/L4Menu/SERVER.txt
  echo username=$UNAME > /home/pi/.smbcredentials
  echo password=$PWORD >> /home/pi/.smbcredentials
  chmod 600 /home/pi/.smbcredentials
  chown pi:pi /home/pi/.smbcredentials
  whiptail --title "Install" --msgbox "Install complete!\nRestart ES to update the menu." 10 40 2
else
  exit 1
fi
