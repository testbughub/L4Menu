#!/bin/bash

SERVERIP=$(cat ./CHANGEME/SERVER.txt | head -n1)
SERVERPORT=$(cat ./CHANGEME/SERVER.txt | tail -n1)
USERNAME=$(cat ./CHANGEME/AUTH.txt | head -n2 | tail -n1)
PASSWORD=$(cat ./CHANGEME/AUTH.txt | head -n4 | tail -n1)
SSHID=$(cat ./CHANGEME/AUTH.txt | tail -n1)

# if whiptail --title "Install" --yesno "This will install L4Menu on your device.\nContinue?" 10 50 2 ;
# then

echo $SERVERIP $SERVERPORT $USERNAME $PASSWORD $SSHID

exit 0
