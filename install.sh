#!/bin/bash

SERVERIP=$(cat ./CHANGEME/SERVER.txt | head -n1)
SERVERPORT=$(cat ./CHANGEME/SERVER.txt | tail -n1)
UNAME=$(cat ./CHANGEME/AUTH.txt | head -n2 | tail -n1)
PASS=$(cat ./CHANGEME/AUTH.txt | head -n4 | tail -n1)
SSHID=$(cat ./CHANGEME/AUTH.txt | tail -n1)

if whiptail --title "Install" --yesno "This will install L4Menu on your device.\nContinue?" 10 50 2 ;
then
  sudo cp ./L4Menu.sh /home/pi/RetroPie/retropiemenu/
  sudo cp /home/pi/.emulationstation/gamelists/retropie/gamelist.xml /home/pi/.emulationstation/gamelists/retropie/gamelist.xml.bak
  sudo cp ./gamelist.xml /home/pi/.emulationstation/gamelists/retropie/
  echo $UNAME > /home/pi/.smbcredentials
  echo $PASS >> /home/pi/.smbcredentials
  whiptail --title "Install" --msgbox "Install complete!"
else
  whiptail --title "Install" --msgbox "Cancelled." 10 40 2
  exit 1
fi





# echo $SERVERIP $SERVERPORT $USERNAME $PASSWORD $SSHID

exit 0
