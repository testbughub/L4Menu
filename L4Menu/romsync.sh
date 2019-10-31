#!/bin/bash

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
    if grep -q "^$type$" $exclude ; then
      echo "$type is excluded"
    else
      rsync -tvurP /home/pi/RetroPie/roms/$type/ /home/pi/temp/$type/
    fi
  done
}
romsync
