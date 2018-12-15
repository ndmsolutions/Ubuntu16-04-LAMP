#!/bin/bash

###############################################################################################
# Apache + PHP7-FPM + MySQL + Ubuntu 16.04                                                    #
# Stack is optimized/tuned for a 256MB server                                                 #
###############################################################################################
    
apt-get update
apt-get -y install aptitude
aptitude -y install nano

echo ""
echo "Installing updates & configuring SSHD / hostname."
sleep 5
./setup.sh basic

echo ""
echo "Installing LAMP."
sleep 5
./setup.sh install

echo ""
echo "Optimizing AWStats, PHP, logrotate & webserver config."
sleep 5
./setup.sh optimize


echo ""
echo "Installation complete!"
echo "Root login disabled."
echo "Please add a normal user now using the \"adduser\" command."
echo "To Install FTP Server \"./setup.sh ftp\" command."
echo "Please add a user with no login if installed FTP using the \"./add_domain_user.sh username\" command."
echo "To Install PhpMyAdmin \"./setup.sh dbgui\" command."