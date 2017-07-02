#!/bin/bash
#Quick config for Ubuntu VM
#Prompt for Sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

#Check if Docker is needed
echo "Would you like to install docker too? Please respond Y or N."
read docker

#Remove junk, upgrade, set timezone, install VMTools, SSH Server and VIM
apt-get remove -y libreoffice-* openoffice* unity-webapps-common gnome-calendar gnome-sudoku gnome-mahjongg gnome-mines cheese* rhythmbox* shotwell* thunderbird* aisleriot
apt autoremove -y
apt-get update && apt-get dist-upgrade -y
timedatectl set-timezone Europe/London
apt-get install -y open-vm-tools open-vm-tools-desktop openssh-server vim

#Install Docker if needed
if [ "$docker" = "Y" ]; then 
	wget -qO- https://get.docker.com | sh
	usermod -aG docker $SUDO_USER
fi

#End script
echo "Script complete - reboot in 15 seconds"
sleep 15s
reboot