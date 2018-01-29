#!/bin/bash
#Doc: This will install everything needed for a dev enviroment.
#Author: Victor V. Piccoli

echo "Overall Configuration of the System"
echo
echo "You may cancel or wait for the initiation," 
echo "it is not recomended to abort in the"
echo "middle of the process"
echo
sleep 10

#Update the System
echo "Updating the System"
sleep 5
echo
apt-get -y update
apt-get -y upgrade
dpkg --add-architecture i386
apt-get -y update
echo

#Install Node 8
echo "Installing NVM and Node 8"
sleep 5
echo
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 8.0.0
nvm alias default node
echo

#Install Git
echo "Installing Git"
sleep 5
apt-get -y install git-all
git config --global push.default matching
echo

#Install Gulp
echo "Installing Gulp"
sleep 5
npm install gulp-cli -g
echo

#Install VSCode IDE
echo "Installing VSCode"
sleep 5
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get install code  
apt-get install code-insiders
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
