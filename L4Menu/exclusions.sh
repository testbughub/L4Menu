#!/bin/bash

file=/usr/share/L4Menu/exclusions.txt
types=(
  amstradpc arcade atari2600 atari5200 atari7800 atari800 atarilynx daphne fba
  fds gamegear gb gba gbc gc genesis mame-advmame mame-libretro mame-mame4all
  mastersystem megadrive n64 nds neogeo nes ngp ngpc ports ps2 psp psx sega32x
  segacd sg-1000 snes vectrex wii zxspectrum
)

function exclusions() {
  for type in ${types[@]}; do
    grep -q "^$type$" $file && status="on" || status="off"
    whiptail_types+="$type $status "
  done
  whiptail \
    --title "Exclusions" \
    --separate-output \
    --noitem \
    --checklist "Select which emulators to EXCLUDE from syncing." 30 40 20 \
    $whiptail_types 2>$file
}

exclusions

echo $file
whiptail --title "Exclusions" --msgbox "The following emulators will now be excluded from syncing:\n\n$(cat /usr/share/L4Menu/exclusions.txt)" 20 30

bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
