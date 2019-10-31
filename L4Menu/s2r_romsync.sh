#!/bin/bash

SERVERIP=$(cat /usr/share/L4Menu/SERVER.txt)
RMOUNTPATH=$(cat /usr/share/L4Menu/PATHS.txt)
exclude=/usr/share/L4Menu/exclusions.txt
include=/usr/share/L4Menu/include.txt
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

function romsync() {
  for type in ${types[@]}; do
    if whiptail --title "ROM Sync" --yesno "This will sync ROM's from the server to RetroPie.\nContinue?" 10 40 2 ; then
      if sudo mount -t cifs -o credentials=/home/pi/.smbcredentials,uid=1000,iocharset=utf8 //$SERVERIP/roms $RMOUNTPATH ; then
        unison $RMOUNTPATH/$type /home/pi/RetroPie/roms/$type -batch -ignore $type
        umount $RMOUNTPATH
      else
        whiptail --title "ROM Sync" --msgbox "Unable to mount the server" 10 40 2
        bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      fi
    else
      bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    fi
  done
}
romsync
