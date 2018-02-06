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
sudo apt-get -y update
sudo apt-get -y upgrade
sudo dpkg --add-architecture i386
sudo apt-get -y update
echo

#Install Node 8
echo "Installing NVM and Node 8"
sleep 3
echo
sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 8.0.0
nvm install 6.0.0
echo

#Install Git
echo "Installing Git"
sleep 3
sudo apt-get -y install git-all
echo

#Install Bower
echo "Installing Bower"
sleep 3 
sudo npm install -g bower
echo

#Install Gulp
echo "Installing Gulp"
sleep 3
sudo npm install gulp-cli -g
echo

#Install Mozilla Firefox
echo "Installing Firefox Browser"
sleep 3
sudo add-apt-repository -y ppa:ubuntu-mozilla-security/ppa
sudo apt-get -y update
sudo apt-get install -y firefox
echo

#Install MongoDb
echo "Installing Mongo data base"
sleep 3
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt-get -y update
sudo apt-get install -y mongodb-org
sudo service mongod start
sudo systemctl enable mongod.service
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
