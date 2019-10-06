# Very very WIP

L4 Menu for RetroPie

## Install
Either plug in a keyboard and press F4, or SSH into your device and run install.sh  
Done!

## Server Samba
For syncing to work, you need to share certain paths with samba on your server.  
Edit your /etc/samba/smb.conf and add the following lines and restart the samba service;

### ROMS
```
[roms]
   path = /path/to/your/roms
   browseable = yes
   read only = no
```

#### Skyscraper
```
[skyscraper]
    path = /path/to/.skyscraper
    browseable = yes
    read only = no
```

## VPN
Place your .ovpn file in /home/pi/ and rename it to "VPN.ovpn"

## Uninstall
Either plug in a keyboard and press F4, or SSH into your device and run uninstall.sh  
Done!
