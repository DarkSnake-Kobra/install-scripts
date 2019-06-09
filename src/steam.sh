#!/bin/bash
[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

function install_steam(){
apt-get install steam:i386
}
install_steam
