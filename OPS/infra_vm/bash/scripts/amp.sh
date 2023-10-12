#!/bin/bash

#######################################
# Bash script to install an AMP stack and adminer, nodejs, npm and composer plus tweaks. For Debian based systems.
#######################################

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

#######################################
# GO to su 
su
send 'sebastienroot'

# Set keyboard in french
setxkbmap fr

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y

# Install of dependencies
echo -e "$Cyan \n Installing dependencies $Color_Off"
sudo apt-get install ca-certificates curl gnupg -y

## Install AMP
echo -e "$Cyan \n Installing Apache2 $Color_Off"
sudo apt-get install apache2 -y

echo -e "$Cyan \n Installing PHP & Requirements $Color_Off"
sudo apt-get install php libapache2-mod-php php-mysql php-cli php-common php-zip php-gd php-mbstring php-curl php-xml php-bcmath -y

echo -e "$Cyan \n Installing MariaDB $Color_Off"
sudo apt-get install mariadb-server -y

echo -e "$Cyan \n Installing adminer $Color_Off"
sudo apt-get install adminer -y

echo -e "$Cyan \n Installing git $Color_Off"
sudo apt-get install git -y

echo -e "$Cyan \n Installing nodejs / npm $Color_Off"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=18
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/source.list.d/nodesource.list
sudo apt-get install nodejs -y 


echo -e "$Cyan \n Installing composer $Color_Off"
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if(hash_file('SHA384','/tmp/composer-setup.php') === '$HASH') {echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php');} echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

## TWEAKS and Settings
# Permissions
#echo -e "$Cyan \n Permissions for /var/www $Color_Off"
#sudo chown -R www-data:www-data /var/www
#echo -e "$Green \n Permissions have been set $Color_Off"

# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
#echo -e "$Cyan \n Enabling Modules $Color_Off"
#sudo a2enmod rewrite
#sudo phpenmod mcrypt

# Restart Apache
#echo -e "$Cyan \n Restarting Apache $Color_Off"
#sudo service apache2 restart
