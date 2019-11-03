#!/bin/bash


if git remote update ; then
  sudo cp /home/pi/L4Menu/L4Menu.sh /home/pi/RetroPie/retropiemenu/
  sudo cp /home/pi/L4Menu/L4Menu/update.sh /usr/share/L4Menu/L4Menu/
  sudo cp /home/pi/L4Menu/L4Menu/s2r_romsync.sh /usr/share/L4Menu/L4Menu/
  sudo cp /home/pi/L4Menu/L4Menu/r2s_romsync.sh /usr/share/L4Menu/L4Menu/
  whiptail --title "Update" --msgbox "Successfully updated L4Menu.\nPlease re-run the script." 10 40 2
else
  whiptail --title "Update" --msgbox "L4Menu is up-to-date." 10 40 2
  bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
fi
