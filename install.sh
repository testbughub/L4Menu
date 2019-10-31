#!/bin/bash


if [[ $EUID -ne 0 ]]; then
  echo "Run as root."
  exit 1
fi
if whiptail --title "Install" --yesno "This will install L4Menu on your device.\nContinue?" 10 40 2 ;
then
  SAMIP=$(whiptail --title "Samba" --inputbox "What is the server IP?" 10 40 3>&1 1>&2 2>&3)
  UNAME=$(whiptail --title "Samba" --inputbox "What is your username for Samba?" 10 40 3>&1 1>&2 2>&3)
  PWORD=$(whiptail --title "Samba" --passwordbox "What is your password for Samba?" 10 40 3>&1 1>&2 2>&3)
  cp ./L4Menu.sh /home/pi/RetroPie/retropiemenu/
  cp /home/pi/.emulationstation/gamelists/retropie/gamelist.xml /home/pi/.emulationstation/gamelists/retropie/gamelist.xml.bak
  cp ./gamelist.xml /home/pi/.emulationstation/gamelists/retropie/
  cp -p ./icons/L4.png /home/pi/RetroPie/retropiemenu/icons/
  cp -r ./L4Menu/ /home/pi/RetroPie/retropiemenu/
  mkdir /usr/share/L4Menu/
  mkdir /home/pi/RetroPie/retropiemenu/L4Menu
  mkdir /mnt/roms /mnt/skyscraper
  touch /usr/share/L4Menu/exclusions.txt
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
