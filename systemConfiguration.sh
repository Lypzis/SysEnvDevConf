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

#Installi Node 6.x
echo "Installing Node 6"
sleep 3
echo
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs
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
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt-get update
apt-get install code
echo

#Install Java 8
echo "Installing Java 8"
sleep 3
mkdir /opt/java && cd /opt/java
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"
tar -zxvf jdk-8u45-linux-x64.tar.gz
cd jdk1.8.0_45/
update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_45/bin/java 100
update-alternatives --config java
echo -n
update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.8.0_45/bin/javac 100
update-alternatives --config javac
echo -n
update-alternatives --install /usr/bin/jar jar /opt/java/jdk1.8.0_45/bin/jar 100
update-alternatives --config jar
echo -n
export JAVA_HOME=/opt/java/jdk1.8.0_45/
export JRE_HOME=/opt/java/jdk1.8.0_45/jre
export PATH=$PATH:/opt/java/jdk1.8.0_45/bin:/opt/java/jdk1.8.0_45/jre/bin
java --version
echo

#Install TeamViewer 12

#Install NetBeans
