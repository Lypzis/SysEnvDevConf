#!/bin/bash
#Doc: This will install everything needed for a dev enviroment.
#Author: Victor V. Piccoli

echo "Overall Configuration of the System"
echo
echo "You may cancel or wait for the initiation," 
echo "it is not recomended to abort in"
echo "the middle of the process"
echo
sleep 5

#Update the System
echo "Updating the System"
sleep 3
echo
apt-get -y update
apt-get -y upgrade
dpkg --add-arch i386
apt-get -y update
echo

#Install Node 8
echo "Installing NVM and Node 8"
sleep 3
echo
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
nvm install 8.0.0
nvm alias default node
echo

#Install Git
echo "Installing Git"
sleep 3
apt-get -y install git-all
echo

#Install Gulp
echo "Installing Gulp"
sleep 3
npm install gulp-cli -g
echo

#Install VSCode IDE
echo "Installing VSCode"
sleep 3
echo

#Install Java 8
echo "Installing Java 8"
sleep 3
echo

#Install TeamViewer 12
echo "Installing TeamViewer"
sleep 3
echo

#Install NetBeans
echo "Installing NetBeans"
sleep 3 
echo

echo "Set up Complete, enjoy coding around! :D"
