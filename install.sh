#!/bin/bash

if whiptail --title "Install" --yesno "This will install L4Menu on your device.\nContinue?" 10 40 2 ;
then
  whiptail --title "Installing..." --gauge "Progress" 10 40 0
  sudo cp ./L4Menu.sh /home/pi/RetroPie/retropiemenu/
  whiptail --title "Installing..." --gauge "Progress" 10 40 10
  sudo cp /home/pi/.emulationstation/gamelists/retropie/gamelist.xml /home/pi/.emulationstation/gamelists/retropie/gamelist.xml.bak
  whiptail --title "Installing..." --gauge "Progress" 10 40 20
  sudo cp ./gamelist.xml /home/pi/.emulationstation/gamelists/retropie/
  whiptail --title "Installing..." --gauge "Progress" 10 40 30
  cp ./icons/L4.png /home/pi/RetroPie/retropiemenu/icons/
  whiptail --title "Installing..." --gauge "Progress" 10 40 40
  sudo mkdir /mnt/roms /mnt/skyscraper
  whiptail --title "Installing..." --gauge "Progress" 10 40 50
  sudo mkdir /usr/share/L4Menu
  whiptail --title "Installing..." --gauge "Progress" 10 40 60
  sudo cp ./CHANGEME/PATHS.txt /usr/share/L4Menu/
  sudo cp ./CHANGEME/SERVER.txt /usr/share/L4Menu/
  sudo cp ./.paths /usr/share/L4Menu/
  whiptail --title "Installing..." --gauge "Progress" 10 40 70
  UNAME=$(whiptail --title "SAMBA" --inputbox "What is your username for Samba?")
  PWORD=$(whiptail --title "SAMBA" --passwordbox "What is your password for Samba?")
  whiptail --title "Installing..." --gauge "Progress" 10 40 80
  echo 'username=$UNAME' > /home/pi/.smbcredentials
  echo 'password=$PWORD' >> /home/pi/.smbcredentials
  whiptail --title "Installing..." --gauge "Progress" 10 40 90
  chmod 600 /home/pi/.smbcredentials
  whiptail --title "Installing..." --gauge "Progress" 10 40 100
  whiptail --title "Install" --msgbox "Install complete!\nRestart ES to update the menu." 10 40 2
else
  exit 1
