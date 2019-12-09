#!/bin/bash

ESEL=$(whiptail \
--title "Extras" \
--menu "Choose option" 10 40 2 \
"1" "Boot/Shutdown splash" \
"2" "Themes" 3>&1 1>&2 2>&3)
case $ESEL in
  1)
  bash /usr/share/L4Menu/L4Menu/splash.sh
  ;;
  2)
  bash /usr/share/L4Menu/L4Menu/themes.sh
  ;;
  *)
  bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
  ;;
esac
