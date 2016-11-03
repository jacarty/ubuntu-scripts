#!/bin/bash
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
apt-get remove -y libreoffice-* openoffice* unity-webapps-common
apt autoremove -y
apt-get update && apt-get dist-upgrade -y
apt-get install -y open-vm-tools open-vm-tools-desktop openssh-server vim
reboot