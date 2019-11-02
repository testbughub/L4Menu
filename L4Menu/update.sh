#!/bin/bash

cd /home/pi/L4Menu/

git remote update

sudo cp ./L4Menu.sh /home/pi/RetroPie/retropiemenu/
sudo cp ./L4Menu/update.sh /usr/share/L4Menu/L4Menu/
sudo cp ./L4Menu/s2r_romsync.sh /usr/share/L4Menu/L4Menu/
sudo cp ./L4Menu/r2s_romsync.sh /usr/share/L4Menu/L4Menu/

bash /home/pi/RetroPie/retropiemenu/L4Menu.sh
