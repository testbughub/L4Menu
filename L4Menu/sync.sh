#!/bin/bash


function mainsync() {
  MSSEL=$(whiptail \
  --title "Sync" \
  --menu "Select option" 10 40 2 \
  "1" "Save State Sync" \
  "2" "ROM Sync" 3>&1 1>&2 2>&3)
  case $MSSEL in
    1)
    function savesync(){
      SSSEL=$(whiptail \
      --title "Sync > Save State" \
      --menu "Select option" 10 40 2 \
      "1" "RetroPie => Server" \
      "2" "Server => RetroPie" 3>&1 1>&2 2>&3)
      case $SSSEL in
        1)
        bash /usr/share/L4Menu/L4Menu/r2s_savesync.sh
        ;;
        2)
        bash /usr/share/L4Menu/L4Menu/s2r_savesync.sh
        ;;
        *)
        bash /usr/share/L4Menu/L4Menu/sync.sh
        ;;
      esac
    }
    savesync
    ;;
    2)
    function romsync(){
      RSSEL=$(whiptail \
      --title "Sync > ROM" \
      --menu "Select option" 10 40 2 \
      "1" "RetroPie => Server" \
      "2" "Server => RetroPie" 3>&1 1>&2 2>&3)
      case $RSSEL in
        1)
        bash /usr/share/L4Menu/L4Menu/r2s_romsync.sh
        ;;
        2)
        bash /usr/share/L4Menu/L4Menu/s2r_romsync.sh
        ;;
        *)
        bash /usr/share/L4Menu/L4Menu/sync.sh
        ;;
      esac
    }
    romsync
    ;;
  esac
}
mainsync
