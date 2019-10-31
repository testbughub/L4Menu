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
  if whiptail --title "ROM Sync" --yesno "This will sync ROM's from RetroPie to the server.\nContinue?" 10 40 2 ; then
    if sudo mount -t cifs -o credentials=/home/pi/.smbcredentials,uid=1000,iocharset=utf8 //$SERVERIP/roms $RMOUNTPATH ; then
      rsync -tvurP --exclude={'*.state*','*.srm','*.mp4','*.jpg','*.png','*.jpeg'} --include={'*.nds','*.cso','*.hi','*.nv','*.000','*.rts','*.grp','*.xml','*.cfg','*.zip','*.wad','*.A52','*.gb','*.rtc','*.GBA','*.gba','*.gbc','*.smd','*.n64','*.z64','*.nes','*.sh','*.iso','*.ISO','*.cue','*.bin','*.BIN','*.m3u'} /home/pi/RetroPie/roms/$type/ /mnt/roms/$type/
    else
      whiptail --title "ROM Sync" --msgbox "Unable to mount the server" 10 40 2
      bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    fi
  fi
}
romsync

bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
