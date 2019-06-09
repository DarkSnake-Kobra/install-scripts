#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

function prerequisites (){
echo "Adding 32 bit library support and updating."
dpkg --add-architecture i386
apt-get update && apt-get upgrade -y

echo "Adding more recent nvidia ppa from graphics drivers team."
add-apt-repository ppa://graphics-drivers/ppa
}

function purge (){
echo "Purging all current nvidia packages. Drivers will remain active until next restart"
apt-get purge nvidia* -y
apt-get autoremove -y
echo "Please do not restart your pc until new drivers are installed."
}

function install_nvidia (){
echo "Will now install most recent Nvidia kernel driver."
apt-get install nvidia-driver-430 -y

echo "Lastly enabling GPU fan"
nvidia-xconfig --cool-bits=4
echo "Please restart your pc to load the changed kernel modules."
}

prerequisites
purge
install_nvidia
