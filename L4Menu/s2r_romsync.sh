#!/bin/bash

SERVERIP=$(cat /usr/share/L4Menu/SERVER.txt)
RMOUNTPATH=$(cat /usr/share/L4Menu/PATHS.txt)
exclude=/usr/share/L4Menu/exclusions.txt
types=(
  amstradpc arcade atari2600 atari5200 atari7800 atari800 atarilynx daphne fba
  fds gamegear gb gba gbc gc genesis mame-advmame mame-libretro mame-mame4all
  mastersystem megadrive n64 nds neogeo nes ngp ngpc ports ps2 psp psx sega32x
  segacd sg-1000 snes vectrex wii zxspectrum
)


# function romsync() {
#   for type in ${types[@]}; do
#     if grep -q "^$type$" $exclude ; then
#       echo "$type is excluded"
#     else
#       echo "$type is included"
#     fi
#   done
# }
# romsync


if sudo mount -t cifs -o credentials=/home/pi/.smbcredentials,uid=1000,iocharset=utf8 //$SERVERIP/roms $RMOUNTPATH ; then
  if whiptail --title "ROM Sync" --yesno "This will sync ROM's from the server to RetroPie.\nDepending on how many ROM's you have, this can take a long time.\nContinue?" 10 40 2 ; then
    function romsync() {
      for type in ${types[@]}; do
        if grep -q "^$type$" $exclude ; then
          echo "$type is excluded"
        else
          unison $RMOUNTPATH/$type /home/pi/RetroPie/roms/$type -batch -silent
        fi
      done
    }
    romsync
  fi
fi

sleep 3

umount $RMOUNTPATH

whiptail --title "ROM Sync" --msgbox "Successfully synced with the server." 10 40 2

bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
