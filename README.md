# WIP

L4Menu for RetroPie

## Description
This is a collection of scripts for RetroPie to,  
for example, sync save states to or from a server.  

PS  
I'm going to be honest and say that I'm in no way a professional programmer.  
I just made this for fun and to learn.  
Any improvements or suggestions is always welcome.

## Features
* Show current local and public (if connected) IP addresses
* Mount options for a server (WIP)
* Sync your save states and ROM's with a server (WIP)
* Connect to your server through VPN (if connected)
* Add my custom Shutdown/Boot Splashscreen

## Install
Either plug in a keyboard and press F4, or SSH into your device and then run install.sh as root.  
Done!

## Running
This can be used inside RetroPie menu, however to change paths,  
you need a keyboard (Press Right and B to select(temporary)).

## Server Samba
For syncing to work, you need to share your ROM's folder with samba on your server.  

#### Linux
Edit your /etc/samba/smb.conf and add the following lines and restart the samba service;
```
[roms]
   path = /path/to/your/roms
   browseable = yes
   read only = no
```

## VPN
Place your .ovpn file in /home/pi/ and rename it to "VPN.ovpn"

## Uninstall
Either plug in a keyboard and press F4, or SSH into your device and run uninstall.sh  
Done!

### To-do
* ~~Rework the main menu~~
* ~~ROM sync~~
* Rework save state sync
* Custom selections for mount points
* ~~Script update option~~
* VPN options
* Different name?
* ~~Custom exclusions~~
* Fix controls for GPi  

### Known issues
* Need to press B to select an option when using an GPi.  
* Can't use custom exclusions menu on GPi.
* ??

### Special Thanks
GeneralDuty @ reddit for exclusion code
