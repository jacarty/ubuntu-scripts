#!/bin/bash
apt-get remove -y libreoffice-* openoffice* unity-webapps-common
apt autoremove -y
apt-get update && apt-get dist-upgrade -y
apt-get install -y open-vm-tools open-vm-tools-desktop openssh-server vim
wget -qO- https://get.docker.com | sh
usermod -aG docker $USER
reboot