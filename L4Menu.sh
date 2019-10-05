#!/bin/bash

SERVERIP=$(cat ./CHANGEME/SERVER.txt | head -n1)
SERVERPORT=$(cat ./CHANGEME/SERVER.txt | tail -n1)
UNAME=$(cat ./CHANGEME/AUTH.txt | head -n2 | tail -n1)
PASS=$(cat ./CHANGEME/AUTH.txt | head -n4 | tail -n1)
SSHID=$(cat ./CHANGEME/AUTH.txt | tail -n1)

function L4Menu() {
  MMSEL=$(whiptail \
  --title "L4 Menu" \
  --menu "Select option" 13 40 5 \
  "1" "Show IP" \
  "2" "Mount options" \
  "3" "Save Sync" \
  "4" "VPN > burken" \
  "5" "Skyscraper Sync" 3>&1 1>&2 2>&3)
  case $MMSEL in
    1)
      IPL=$(hostname -I)
      IPP=$(wget -qO- http://ipecho.net/plain ; echo)
      whiptail --title "IP's" --msgbox "Local IP's: $IPL \
      Public IP: $IPP" 10 40 2
      sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
    ;;
    2)
      MOUNTPOINT=$(whiptail --title "Mount" --inputbox "Where do you want to mount the server?" 10 40 /mnt 3>&1 1>&2 2>&3)
      ANSWER=$?
      if [ $ANSWER = '/mnt' ]; then
        if sudo mount -t cifs -o user=$USERNAME //$SERVERIP/roms /mnt ;
        then
          whiptail --title "Mount" --msgbox "Successfully mounted server on '/mnt'."
        else
          whiptail --title "Mount" --msgbox "Unable to mount server."
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        fi
      else
        if sudo mount -t cifs -o user=$USERNAME //$SERVERIP/roms $ANSWER ;
        then
          whiptail --title "Mount" --msgbox "Successfully mounted server on '$ANSWER'."
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        else
          whiptail --title "Mount" --msgbox "Unable to mount server on '$ANSWER'."
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        fi
      fi
    ;;
    3)
      SSSEL=$(whiptail \
      --title "Save Sync" \
      --menu "Select option" 10 40 2 \
      "1" "gretro > burken" \
      "2" "burken > gretro" 3>&1 1>&2 2>&3)
      case $SSSEL in
        1)
          if whiptail --title "Save Sync" --yesno "This will sync save states from gretro to burken. Do you want to continue?" 10 40 2 ;
          then
            sudo cp /etc/fstab.hdd /etc/fstab
            if sudo mount -a ;
            then
              sudo rsync -tvurP --include={'*.state*','*.srm'} --exclude={'*.nds','ps2/','psp/','*.cso','*.hi','*.nv','*.000','*.rts','*.grp','*.xml','*.cfg','*.zip','*.wad','*.A52','*.gb','*.rtc','*.GBA','*.gba','*.gbc','*.smd','*.n64','*.z64','*.nes','*.sh','*.iso','*.ISO','*.cue','*.bin','*.BIN','*.m3u','*.mp4','*.jpg','*.png','*.jpeg'} /home/pi/RetroPie/roms/* /mnt/hdd4ROMS/
              sudo umount /mnt/hdd4ROMS
              whiptail --title "Save Sync" --msgbox "Successfully synced with burken." 8 45
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            else
              whiptail --title "Failed" --msgbox "Unable to mount hdd4ROMS" 8 45
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            fi
          else
            sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
          fi
        ;;
        2)
          if whiptail --title "Save Sync" --yesno "This will sync save states from burken to gretro. Do you want to continue?" 10 40 2 ;
          then
            sudo cp /etc/fstab.hdd /etc/fstab
            if sudo mount -a ;
            then
              sudo rsync -tvurP --include={'*.state*','*.srm'} --exclude={'*.nds','ps2/','psp/','*.cso','*.hi','*.nv','*.000','*.rts','*.grp','*.xml','*.cfg','*.zip','*.wad','*.A52','*.gb','*.rtc','*.GBA','*.gba','*.gbc','*.smd','*.n64','*.z64','*.nes','*.sh','*.iso','*.ISO','*.cue','*.bin','*.BIN','*.m3u','*.mp4','*.jpg','*.png','*.jpeg'} /mnt/hdd4ROMS/* /home/pi/RetroPie/roms/
              sudo umount /mnt/hdd4ROMS
              whiptail --title "Save Sync" --msgbox "Successfully synced with burken." 8 45
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            else
              whiptail --title "Failed" --msgbox "Unable to mount hdd4ROMS" 8 45
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            fi
          else
            sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
          fi
        ;;
        *)
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      esac
    ;;
    4)
      if pgrep -x openvpn > /dev/null
      then
        OVSEL=$(whiptail \
        --title "VPN > burken" \
        --menu "OpenVPN is already running. Choose what to do." 11 40 2 \
        "1" "Disconnect" \
        "2" "Reconnect" 3>&1 1>&2 2>&3)
        case $OVSEL in
          1)
            sudo pkill openvpn
            sleep 2
            LOCIP=$(hostname -I)
            whiptail --title "VPN > burken" --msgbox "Your current local IP is: $LOCIP" 10 40 2
            sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
          ;;
          2)
            sudo pkill openvpn
            sudo nohup openvpn /home/pi/lamarca.ovpn > /dev/null &
            whiptail --title "VPN > burken" --msgbox "Please wait..." 10 40 2
            sleep 5
            LOCIP=$(hostname -I)
            if whiptail --title "VPN > burken" --yesno "Your current local IP is: $LOCIP\nRefresh?" 10 40 2 ;
            then
              whiptail --title "VPN > burken" --msgbox "Your current local IP is: $LOCIP" 10 40 2
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
        sudo nohup openvpn /home/pi/lamarca.ovpn > /dev/null &
       # whiptail --title "VPN > burken" --msgbox "Please wait..." 10 40 2
        sleep 5
        LOCIP=$(hostname -I)
        if whiptail --title "VPN > burken" --yesno "Your current local IP is: $LOCIP\nRefresh?" 10 40 2 ;
        then
          whiptail --title "VPN > burken" --msgbox "Your current local IP is: $LOCIP" 10 40 2
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        else
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
        fi
      fi
    ;;
    5)
      SKSEL=$(whiptail \
      --title "Skyscraper" \
      --menu "Select option" 13 40 5 \
      "1" "gretro > burken" \
      "2" "burken > gretro" 3>&1 1>&2 2>&3)
      case $SKSEL in
        1)
          if whiptail --title "Skyscraper" --yesno "This will sync Skyscraper from gretro to burken. Do you want to continue?" 10 40 4 ;
          then
            sudo cp /etc/fstab.bur /etc/fstab
            if sudo mount -a ;
            then
              sudo rsync -tvurP /home/pi/.skyscraper/* /mnt/skyscraper/
              sudo umount /mnt/burken /mnt/skyscraper
              sudo cp /etc/fstab.hdd /etc/fstab
              if sudo mount -a ;
              then
                rsync -tvurP --include={'*.mp4','*.png','*.xml'} --exclude={'*.state*','ps2/','psp/','*.nds','*.cso','*.hi','*.nv','*.000','*.rts','*.grp','*.cfg','*.zip','*.wad','*.A52','*.gb','*.rtc','*.srm','*.GBA','*.gba','*.gbc','*.smd','*.n64','*.z64','*.nes','*.sh','*.iso','*.ISO','*.cue','*.bin','*.BIN','*.m3u'} /home/pi/RetroPie/roms/* /mnt/hdd4ROMS/
                sudo umount /mnt/hdd4ROMS
                whiptail --title "Skyscraper" --msgbox "Sync complete!" 10 40 4
                sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
              else
                whiptail --title "Failed" --msgbox "Unable to mount hdd4ROMS" 8 45
                sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
              fi
            else
              whiptail --title "Failed" --msgbox "Unable to mount burken" 8 45
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            fi
          else
            sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
          fi
        ;;
        2)
          if whiptail --title "Skyscraper" --yesno "This will sync Skyscraper from burken to gretro. Do you want to continue?" 10 40 4 ;
          then
            sudo cp /etc/fstab.bur /etc/fstab
            if sudo mount -a ;
            then
              sudo rsync -tvurP /mnt/skyscraper/* /home/pi/.skyscraper/
              sudo umount /mnt/burken /mnt/skyscraper
              sudo cp /etc/fstab.hdd /etc/fstab
              sudo mount -a
              rsync -tvurP --include={'*.mp4','*.png','*.xml'} --exclude={'*.state*','ps2/','psp/','*.nds','*.cso','*.hi','*.nv','*.000','*.rts','*.grp','*.cfg','*.zip','*.wad','*.A52','*.gb','*.rtc','*.srm','*.GBA','*.gba','*.gbc','*.smd','*.n64','*.z64','*.nes','*.sh','*.iso','*.ISO','*.cue','*.bin','*.BIN','*.m3u'} /mnt/hdd4ROMS/* /home/pi/RetroPie/roms/
              whiptail --title "Skyscraper" --msgbox "Sync complete!" 10 40 4
              sudo umount /mnt/hdd4ROMS
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            else
              whiptail --title "Failed" --msgbox "Unable to mount burken" 8 45
              sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
            fi
          else
            sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
          fi
        ;;
        *)
          sudo bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
      esac
    ;;
  esac
}

L4Menu
