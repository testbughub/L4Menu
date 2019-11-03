#!/bin/bash

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
    if whiptail --title "VPN" --yesno "Do you want to connect through VPN to the server?" 10 40 2 ; then
      sudo nohup openvpn /home/pi/VPN.ovpn > /dev/null &
      sleep 5
      LOCIP=$(hostname -I)
      if whiptail --title "VPN" --yesno "Your current local IP is: $LOCIP\nRefresh?" 10 40 2 ;
      then
        whiptail --title "VPN" --msgbox "Your current local IP is: $LOCIP" 10 40 2
        sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      else
        sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      fi
    else
      bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    fi
  fi
else
  whiptail --title "VPN > server" --msgbox "Couldn't find required VPN file.\nLook in README for more info." 10 40 2
  sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
fi
