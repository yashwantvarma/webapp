#!/bin/bash

sudo apt-get update -y
sudo apt-get dist-upgrade -y
apt-get install git -y
git clone https://github.com/brichbourg/Multi-Tier-App-Demo.git
mv Multi-Tier-App-Demo /opt/Multi-Tier-App-Demo
sudo apt-get install apache2 -y
sudo apt-get install python-pip -y
sudo pip install pymysql -y
sudo a2dismod mpm_event
sudo a2enmod mpm_prefork cgi
sudo service apache2 restart
wget "https://s3.amazonaws.com/richbourg-s3/mtwa/app/000-default.conf"
wget "https://s3.amazonaws.com/richbourg-s3/mtwa/app/ports.conf"
sudo cp 000-default.conf /etc/apache2/sites-enabled/
sudo cp ports.conf /etc/apache2/
sudo service apache2 restart
