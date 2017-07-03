#!/bin/bash
#Quick config for Ubuntu VM
#Prompt for Sudo
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

#Check if Docker is needed
echo "Would you like to install docker too? Please respond Y or N."
read docker
echo "Would you like to install K8S components too? Please respond Y or N."
read k8s

#Remove junk, upgrade, set timezone, install VMTools, SSH Server and VIM
apt-get remove -y libreoffice-* openoffice* unity-webapps-common gnome-calendar gnome-sudoku gnome-mahjongg gnome-mines cheese* rhythmbox* shotwell* thunderbird* aisleriot
apt autoremove -y
apt-get update && apt-get dist-upgrade -y
timedatectl set-timezone Europe/London
apt-get install -y open-vm-tools open-vm-tools-desktop openssh-server net-tools vim 

#Install Docker if needed
if [ "$docker" = "Y" ]; then 
wget -qO- https://get.docker.com | sh
usermod -aG docker $SUDO_USER
apt-get update && apt-get install -y
fi

#Install K8S components if needed
if [ "$k8s" = "Y" ]; then 
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main 
EOF
apt-get update && apt-get install -y kubelet kubeadm
fi

#End script
echo "Script complete - reboot in 15 seconds"
sleep 15s
reboot