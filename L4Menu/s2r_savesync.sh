#!/bin/bash

SERVERIP=$(cat /usr/share/L4Menu/SERVER.txt)
RMOUNTPATH=$(cat /usr/share/L4Menu/PATHS.txt)


if sudo mount -t cifs -o credentials=/home/pi/.smbcredentials,uid=1000,iocharset=utf8 //$SERVERIP/roms $RMOUNTPATH ; then
  if whiptail --title "Sync > Save" --yesno "This will sync save states from the server to RetroPie.\nFor the moment it doesn't follow your custom exclusions list.\nContinue?" 10 40 3 ; then
    sudo rsync -tvourmP --include={'*.state*','*.srm','*.smc'} --exclude={'*.nds','*.cso','*.hi','*.nv','*.000','*.rts','*.grp','*.xml','*.cfg','*.zip','*.wad','*.A52','*.gb','*.rtc','*.GBA','*.gba','*.gbc','*.smd','*.n64','*.z64','*.nes','*.sh','*.iso','*.ISO','*.cue','*.bin','*.BIN','*.m3u','*.mp4','*.jpg','*.png','*.jpeg'} $RMOUNTPATH/* /home/pi/RetroPie/roms/
    whiptail --title "Sync > Save" --msgbox "Successfully synced with the server" 10 40 2
  fi
else
  whiptail --title "Sync > Save" --msgbox "Unable to mount the server." 10 40 2
fi

sudo umount $RMOUNTPATH

bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
