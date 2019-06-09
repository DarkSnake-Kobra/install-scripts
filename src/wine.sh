#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

function install_wine(){
echo "Retrieving winehq public key"
wget -nc https://dl.winehq.org/wine-builds/winehq.key sudo apt-key add winehq.key
echo "Adding winehq disco repository"
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main'
echo "Installing wine staging with recommended packages"
apt-get install --install-recommends winehq-staging 
}
install_wine
