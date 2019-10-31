# WIP

L4 Menu for RetroPie

## Description
This is a collection of scripts for RetroPie to sync ROM's and  
skyscraper content to or from a server.  
I'm going to be honest and say that I'm in no way a professional programmer.  
I just made this for fun and to learn.  
Any improvements or suggestions is always welcome.

PS  
There's a lot of emulators it doesn't cover. If any you feel should be added, let me know.

## Install
Either plug in a keyboard and press F4, or SSH into your device and then run install.sh as root.  
Done!

## Running
This can be used inside RetroPie menu, however to change paths, you need a keyboard (run with sudo).

## Server Samba
For syncing to work, you need to share certain paths with samba on your server.  
Edit your /etc/samba/smb.conf and add the following lines and restart the samba service;

#### ROMS
```
[roms]
   path = /path/to/your/roms
   browseable = yes
   read only = no
```

#### Skyscraper
```
[skyscraper]
    path = /home/$USER/.skyscraper
    browseable = yes
    read only = no
```

## VPN
Place your .ovpn file in /home/pi/ and rename it to "VPN.ovpn"

## Uninstall
Either plug in a keyboard and press F4, or SSH into your device and run uninstall.sh  
Done!

### To-do
* ~~ROM sync~~
* Custom selections for mount points
* ~~Script update option~~
* VPN options
* Make separate sections for every options
* Different name?
* ~~Custom exclusions~~
* ???  

### Known issues
* Need to press B to select an option when using an GPi.  
* Can't use custom exclusions menu on GPi.
* ??

### Special Thanks
GeneralDuty @ reddit for the exclusion code
