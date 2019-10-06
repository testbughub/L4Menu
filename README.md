# Very WIP

L4 Menu for RetroPie

## Install
Run install.sh as root.
Done!

## Server Samba
For syncing to work, you need to share certain paths with samba on your server.
Edit your /ets/samba/smb.conf and add the following lines and restart the samba service;

### ROMS folder
```
[roms]
   path = /path/to/your/roms
   browseable = yes
   read only = no
```

#### Skyscraper folder
```
[skyscraper]
    path = /path/to/.skyscraper
    browseable = yes
    read only = no
```

## VPN
Place your .ovpn file in /home/pi/ and rename it to "VPN.ovpn"

## Uninstall
Run uninstall.sh as root.
