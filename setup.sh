#!/bin/bash
#Quick config for Ubuntu VM
#Prompt for Sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

#Remove junk, upgrade and install VMTools, SSH Server and VIM
apt-get remove -y libreoffice-* openoffice* unity-webapps-common gnome-calendar gnome-sudoku gnome-mahjongg gnome-mines cheese* rhythmbox* shotwell* thunderbird* aisleriot
apt autoremove -y
apt-get update && apt-get dist-upgrade -y
apt-get install -y open-vm-tools open-vm-tools-desktop openssh-server vim

#End script
echo "Script complete - reboot in 15 seconds"
sleep 15s
reboot