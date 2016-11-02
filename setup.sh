#!/bin/bash
apt-get remove -y libreoffice-* openoffice* unity-webapps-common
apt-get update
apt-get upgrade -y
apt-get install -y open-vm-tools open-vm-tools-desktop vim
reboot