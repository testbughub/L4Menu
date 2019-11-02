#!/bin/bash

SUNAME=$(cat /home/pi/.smbcredentials | head -n1 | cut -c10-32)
SPASS=$(cat /home/pi/.smbcredentials | tail -n1 | cut -c10-32)
RMOUNTPATH=$(cat /usr/share/L4Menu/PATHS.txt)
SERVERIP=$(cat /usr/share/L4Menu/SERVER.txt)
EXCLUSIONS=$(cat /usr/share/L4Menu/exclusions.txt)

function L4Menu() {
  MMSEL=$(whiptail \
  --title "L4 Menu" \
  --menu "Select option" 13 40 7 \
  "1" "Show IP" \
  "2" "Mount options" \
  "3" "ROM Sync" \
  "4" "VPN" \
  "5" "Update script" 3>&1 1>&2 2>&3)
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
    sudo umount $RMOUNTPATH
    RSSEL=$(whiptail \
    --title "ROM Sync" \
    --menu "Select option" 13 40 5 \
    "1" "RetroPie > Server" \
    "2" "Server > RetroPie" \
    "3" "Exclusions" 3>&1 1>&2 2>&3)
    case $RSSEL in
      1)
      bash /usr/share/L4Menu/L4Menu/r2s_romsync.sh
      ;;
      2)
      bash /usr/share/L4Menu/L4Menu/s2r_romsync.sh
      ;;
      3)
      bash /usr/share/L4Menu/L4Menu/exclusions.sh
      ;;
      *)
      bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      ;;
    esac
    ;;
    4)
    if [ -f /home/pi/VPN.ovpn ] ;
    then
      if pgrep -x openvpn > /dev/null
      then
        OVSEL=$(whiptail \
        --title "VPN > server" \
        --menu "VPN is already running. Choose what to do." 11 40 2 \
        "1" "Disconnect" \
        "2" "Reconnect" 3>&1 1>&2 2>&3)
        case $OVSEL in
          1)
            sudo pkill openvpn
            sleep 2
            LOCIP=$(hostname -I)
            whiptail --title "VPN > server" --msgbox "Your current local IP is: $LOCIP" 10 40 2
            sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
          ;;
          2)
            sudo pkill openvpn
            sudo nohup openvpn /home/pi/VPN.ovpn > /dev/null &
            sleep 5
            LOCIP=$(hostname -I)
            if whiptail --title "VPN > server" --yesno "Your current local IP is: $LOCIP\nRefresh?" 10 40 2 ;
            then
              whiptail --title "VPN > server" --msgbox "Your current local IP is: $LOCIP" 10 40 2
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            else
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            fi
          ;;
          *)
            sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
          ;;
        esac
      else
        sudo nohup openvpn /home/pi/VPN.ovpn > /dev/null &
        sleep 5
        LOCIP=$(hostname -I)
        if whiptail --title "VPN > server" --yesno "Your current local IP is: $LOCIP\nRefresh?" 10 40 2 ;
        then
          whiptail --title "VPN > server" --msgbox "Your current local IP is: $LOCIP" 10 40 2
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        else
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        fi
      fi
    else
      whiptail --title "VPN > server" --msgbox "Couldn't find required VPN file.\nLook in README for more info." 10 40 2
      sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    fi
  ;;
    5)
    cd /home/pi/RetroPie/retropiemenu/
    if wget https://raw.githubusercontent.com/testbughub/L4Menu/master/L4Menu.sh ;
    then
      wget -O /usr/share/L4Menu/L4Menu/exclusions.sh https://raw.githubusercontent.com/testbughub/L4Menu/master/L4Menu/exclusions.sh
      wget -O /usr/share/L4Menu/L4Menu/r2s_romsync.sh https://raw.githubusercontent.com/testbughub/L4Menu/master/L4Menu/r2s_romsync.sh
      wget -O /usr/share/L4Menu/L4Menu/s2r_romsync.sh https://raw.githubusercontent.com/testbughub/L4Menu/master/L4Menu/s2r_romsync.sh
      whiptail --title "Update" --msgbox "Successfully updated L4Menu.\nPlease rerun the script." 10 40 2
      exit 0
    else
      whiptail --title "Update" --msgbox "Unable to update L4Menu" 10 40 2
      bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    fi
    cd -
    ;;
  esac
}

L4Menu
