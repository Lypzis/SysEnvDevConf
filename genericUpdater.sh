#!/bin/bash

#Remove, clean, update and upgrade the system

echo "Starting the Update of the System"
sleep 4
echo
sudo apt-get -y autoclean 
sudo apt-get -y autoremove 
sudo apt-get -y update 
sudo apt-get -y upgrade
dpkg --list | grep linux-image | awk '{ print $2 }' | sort -V | sed -n '/'`uname -r`'/q;p' | xargs sudo apt-get -y purge
echo
echo "Update complete!"
