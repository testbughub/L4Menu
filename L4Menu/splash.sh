#!/bin/bash

SPSEL=$(whiptail \
--title "Extras > Boot/Shutdown Splash" \
--menu "Choose option" 10 40 2 \
"1" "Install Boot Splash" \
"2" "Install Shutdown Splash" 3>&1 1>&2 2>&3)
case $SPSEL in
  1)
  if whiptail --title "Boot Splash" --yesno "This will install my custom boot splashscreen.\nContinue?" 10 40 3 ; then
    wget -O /home/pi/RetroPie/splashscreens/RPz_on.mp4 https://github.com/testbughub/L4Menu_extras/raw/master/extras/RPz_on.mp4
    echo "/home/pi/RetroPie/splashscreens/RPz_on.mp4" > /etc/splashscreen.list
    if whiptail --title "Boot Splash" --yesno "Would you like to hide the EmulationStation splash?" 10 40 2 ; then
      echo "<bool name="SplashScreen" value="false" />" >> /home/pi/.emulationstation/es_settings.cfg
    fi
    whiptail --title "Boot Splash" --msgbox "Successfully installed the boot splash.\nReboot to see effect." 10 40 3
    bash /usr/share/L4Menu/L4Menu/splash.sh
  else
    bash /usr/share/L4Menu/L4Menu/splash.sh
  fi
  ;;
  2)
  if whiptail --title "Shutdown Splash" --yesno "This will install my custom shutdown splashscreen.\nContinue?" 10 40 3 ; then
    sudo cp /opt/RetroFlag/SafeShutdown.py /opt/RetroFlag/SafeShutdown.py.bak
    sudo wget -O /opt/RetroFlag/SafeShutdown.py https://raw.githubusercontent.com/testbughub/L4Menu_extras/master/extras/SafeShutdown.py
    wget -O /home/pi/RetroPie/splashscreens/RPz_off.mp4 https://github.com/testbughub/L4Menu_extras/raw/master/extras/RPz_off.mp4
    sudo chown -R pi:pi /home/pi/RetroPie/splashscreens/Rpz*
    whiptail --title "Shutdown Splash" --msgbox "Successfully installed the shutdown splash.\nReboot to see effect." 10 40 3
  else
    bash /usr/share/L4Menu/L4Menu/splash.sh
  fi
  ;;
  *)
  bash /usr/share/L4Menu/L4Menu/extras.sh
  ;;
esac
