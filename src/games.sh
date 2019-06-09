#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

function menu(){
echo "Select which 3rd party app to install";
echo "1. Steam. 2 Discord. 3. Wine";
echo "4. Gnome (upstream look)";

echo -n "Type a menu number and hit [ENTER]"
read input

if ($input == "1"); then
	install_steam
else if ($input =="2"); then
	install_discord
else if ($input =="3"); then
	install_wine
else if ($input =="4"); then
	install_vanilla_gnome
else if ($input =="0"); then
	exit 0
else
	echo "Not a valid option."
exit 0

}

function install_steam(){
apt-get install steam:i386
}

function install_discord(){
echo "Downloading discord debian package"
wget https://discordapp.com/api/download?=linux&format=deb

echo "Installing discord via dpkg"
dpkg -i discord*.deb
echo "Ensuring deps are met"
apt-get -f install
}

function install_wine(){
echo "Retrieving winehq public key"
wget -nc https://dl.winehq.org/wine-builds/winehq.key apt-key add winehq.key
echo "Adding winehq disco repository"
apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ disco main'
echo "Installing wine staging with recommended packages"
apt-get install --install-recommends winehq-staging 
}

function install_vanilla_gnome(){
apt-get install vanilla-gnome-settings -y
echo "You will need to restart your pc and select 'GNOME on Xorg' from the gear menu below password entry box"
echo "Be advised GNOME on Wayland is still experimental and some apps may not function properly."
}
menu
