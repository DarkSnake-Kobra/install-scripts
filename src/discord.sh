#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

function install_discord(){
echo "Downloading discord debian package"
wget https://discordapp.com/api/download?=linux&format=deb

echo "Installing discord via dpkg"
dpkg -i discord*.deb
echo "Ensuring deps are met"
apt-get -f install
}
install_discord
