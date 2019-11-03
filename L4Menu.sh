#!/bin/bash

SUNAME=$(cat /home/pi/.smbcredentials | head -n1 | cut -c10-32)
SPASS=$(cat /home/pi/.smbcredentials | tail -n1 | cut -c10-32)
RMOUNTPATH=$(cat /usr/share/L4Menu/PATHS.txt)
SERVERIP=$(cat /usr/share/L4Menu/SERVER.txt)

function L4Menu() {
  MMSEL=$(whiptail \
  --title "L4 Menu" \
  --menu "Select option" 13 40 5 \
  "1" "Show IP" \
  "2" "Mount" \
  "3" "Sync" \
  "4" "VPN" \
  "5" "Update" 3>&1 1>&2 2>&3)
  case $MMSEL in
    1)
    IPL=$(hostname -I)
    IPP=$(wget -qO- http://ipecho.net/plain ; echo)
    whiptail --title "IP's" --msgbox "Local IP's: $IPL \
    Public IP: $IPP" 10 40 2
    sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    ;;
    2)
    MOSEL=$(whiptail \
    --title "Mount" \
    --menu "Select option" 13 40 5 \
    "1" "Set default mount path" \
    "2" "Temporary mount point" \
    "3" "Dismount server" 3>&1 1>&2 2>&3)
    case $MOSEL in
      1)
      ANSWER=$(whiptail --title "Mount" --inputbox "Where do you want to mount the server?" 10 40 /mnt 3>&1 1>&2 2>&3)
      if [[ $ANSWER -lt 1 ]]; then
        whiptail --title "Mount" --msgbox "Invalid mountpoint." 10 40 2
        sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      else
        cat /usr/share/L4Menu/PATHS.txt | head -n5 > /usr/share/L4Menu/.PATHS.txt
        echo $ANSWER >> /usr/share/L4Menu/.PATHS.txt
        sudo mv /usr/share/L4Menu/.PATHS.txt /usr/share/L4Menu/PATHS.txt
        whiptail --title "Mount" --msgbox "$ANSWER is now the default mountpoint" 10 40 2
        sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      fi
      ;;
      2)
      ANSWER=$(whiptail --title "Mount" --inputbox "Where do you want to mount the server?" 10 40 /mnt 3>&1 1>&2 2>&3)
      if [[ $ANSWER -lt 1 ]]; then
        whiptail --title "Mount" --msgbox "Invalid mountpoint." 10 40 2
        sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      else
        if sudo mount -t cifs -o credentials=/home/pi/.smbcredentials,uid=1000,iocharset=utf8 //$SERVERIP/ $ANSWER ;
        then
          whiptail --title "Mount" --msgbox "Successfully mounted the server on $ANSWER" 10 40 2
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        else
          whiptail --title "Mount" --msgbox "Unable to mount the server on $ANSWER" 10 40 2
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        fi
      fi
      ;;
      3)
      if whiptail --title "Dismount" --yesno "Do you want to dismount the server?" 10 40 2 ;
      then
        sudo umount $RMOUNTPATH $SMOUNTPATH $ANSWER
        whiptail --title "Dismount" --msgbox "Successfully dismounted the server." 10 40 2
        sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      else
        sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      fi
    esac
    ;;
    3)
      bash /usr/share/L4Menu/L4Menu/sync.sh
      ;;
    esac
    ;;
    4)
    bash /usr/share/L4Menu/L4Menu/vpn.sh
    ;;
    5)
    bash /usr/share/L4Menu/L4Menu/update.sh
    ;;
  esac
}
L4Menu
