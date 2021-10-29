#This scritpt automates the creation of a Apache web server
#It then configures firewall settings

#!/bin/bash

#Update repositories on system
sudo apt update

#Install the server
sudo apt install apache2

#Wait 3 seconds 
sleep 3

echo -e "Apache server \vhas been provisioned!"

#Next I will configure some Firewall Settings
echo List appplication profiles needed to enable access

sudo ufw app list 
sudo ufw allow 'Apache'

#Validate server is running
sudo systemctl status apache2

#Validate the server is running
#Checking that it listens on current IP address
hostname -I

#Wait 2 seconds 
sleep 2

echo -e "Server is running \vand \vListening on current IP address!"

