#!/bin/bash


cd /home/pi/L4Menu

if sudo git pull ; then
  sudo cp /home/pi/L4Menu/L4Menu.sh /home/pi/RetroPie/retropiemenu/
  sudo cp -r /home/pi/L4Menu/L4Menu /usr/share/L4Menu/
  whiptail --title "Update" --msgbox "Successfully updated L4Menu.\nPlease re-run the script." 10 40 2
else
  whiptail --title "Update" --msgbox "L4Menu is up-to-date." 10 40 2
  bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
fi
