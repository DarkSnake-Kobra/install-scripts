#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

function install_vanilla_gnome(){
apt-get install vanilla-gnome-settings -y
echo "You will need to restart your pc and select 'GNOME on Xorg' from the gear menu below password entry box"
echo "Be advised GNOME on Wayland is still experimental and some apps may not function properly."
}
install_vanilla_gnome
