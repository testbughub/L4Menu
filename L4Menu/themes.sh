#!/bin/bash

function themes() {
  TSEL=$(whiptail \
  --title "Extras > Themes" \
  --menu "Select option" 13 10 6 \
  "1" "Gameboy GPi" \
  "2" "More to come..." 3>&1 1>&2 2>&3)
  case $TSEL in
    1)
    if whiptail --title "Themes" --yesno "This will install the Gameboy GPi theme.\nContine?" 10 40 3 ; then
      if wget -O "/etc/emulationstation/themes/Gameboy_GPi.tar.gz" "https://github.com/testbughub/L4Menu_extras/raw/master/extras/themes/Gameboy_GPi.tar.gz" ; then
	tar -xvf "/etc/emulationstation/themes/Gameboy_GPi.tar.gz"
	mv Gameboy\ GPi/ /etc/emulationstation/themes/
        rm -f /etc/emulationstation/themes/Gameboy_GPi.tar.gz
        whiptail --title "Themes" --msgbox "Successfully downloaded the Gameboy GPi theme." 10 40 3
        bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      else
        whiptail --title "Themes" --msgbox "Unable to download the theme." 10 40 3
        bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      fi
    fi
    ;;
    2)
    bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    ;;
    *)
    bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    ;;
  esac
}
themes
