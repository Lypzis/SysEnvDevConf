#!/bin/bash
#Doc: This will install everything needed for a dev enviroment.
#Author: Victor V. Piccoli

echo "Overall Configuration of the System - Ubuntu and derivates"
echo
echo "You may cancel or wait for the start," 
echo "it is not recomended to abort in the middle of the process"
echo
sleep 7

#Update the System
echo "Updating the System"
sleep 3
echo
sudo apt-get -y update
sudo apt-get -y upgrade
sudo dpkg --add-architecture i386
sudo apt-get -y update
echo

#Installing Vim-Anthena
echo "Installing VI syntax highlight" 
sudo apt-get -y install vim-athena
echo

#Install Node 8
echo "Installing NVM and Node 8"
sleep 3
echo
sudo wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | sudo bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
sudo chmod -R 777 "$HOME/.nvm" 
nvm install 8.0.0
nvm install-latest-npm
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
npm install -g bower
echo

#Install Yarnpkg
echo "Installing Yarn"
sleep 3 
sudo apt -y remove cmdtest
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get -y update && sudo apt-get -y install yarn
echo

#Install Gulp
echo "Installing Gulp"
sleep 3
npm install gulp-cli -g
echo

#Install Electron-Forge
echo "Installing Electron-forge"
sleep 3
npm install -g electron-forge
echo

#Install Yeoman
echo "Installing Yeoman"
sleep 3
npm install -g yo
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

#Install Postman
echo "Installing Postman"
sleep 3
sudo wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
sudo rm postman.tar.gz 
sudo ln -s /opt/Postman/Postman /usr/bin/postman
echo "Inserting Postman to search(May work only in Ubuntu)"
sleep 5
cat > ~/.local/share/applications/postman.desktop <<EOL
	[Desktop Entry]
	Encoding=UTF-8
	Name=Postman
	Exec=postman
	Icon=/opt/Postman/resources/app/assets/icon.png
	Terminal=false
	Type=Application
	Categories=Development;
EOL
echo "Inserting Postman to Desktop"
cat > ~/Desktop/postman.desktop <<EOL
        [Desktop Entry]
        Encoding=UTF-8
        Name=Postman
        Exec=postman
        Icon=/opt/Postman/resources/app/assets/icon.png
        Terminal=false
        Type=Application
        Categories=Development;
EOL
echo

#Firewall GUFW
echo "Installing Firewall Interface"
sleep 3
sudo apt-get install gufw
echo

#System Updater
echo "Generating systemUpdater.sh"
sleep 3
sudo touch systemUpdater.sh
sudo chmod 755 systemUpdater.sh
cat > sudo ./systemUpdater.sh << EOL
#!/bin/bash
#Author: Victor V. Piccoli
#
#Doc:
#Update the System at Startup.
#log ----> Regiter errors occurred.
 
log=/home/victorpiccoli/Logs/systemUpdaterError.txt
 
sudo apt-get -y autoclean 2> \$log
sudo apt-get -y autoremove 2>> \$log
sudo apt-get -y update 2>> \$log
sudo apt-get -y upgrade 2>> \$log
sudo apt-get -y dist-upgrade 2>> \$log
 
echo >> \$log
date >> \$log
echo "Update Completed! :D" >> \$log
EOL
echo
echo "Acess this file in: ./systemUpdater.sh"
echo "whenever you want to update the system"
echo


echo "Set up Complete, enjoy coding around! :D"
