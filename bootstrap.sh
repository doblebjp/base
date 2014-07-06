#!/usr/bin/env bash

# set timezone
TIMEZONE="Europe/Madrid"
echo $TIMEZONE | tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# update package list
apt-get update

# apache
apt-get install -y apache2
rm -rf /var/www/html
ln -fs /vagrant/web /var/www/html

# php
apt-get install -y php5 php-apc php5-mysql php5-json php5-intl
echo "date.timezone = $TIMEZONE" > /etc/php5/mods-available/timezone.ini
(cd /etc/php5/cli/conf.d && ln -s ../../mods-available/timezone.ini 01-timezone.ini) 
(cd /etc/php5/apache2/conf.d && ln -s ../../mods-available/timezone.ini 01-timezone.ini) 
service apache2 reload

# mysql
DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# curl
apt-get install -y curl

# application setup from here, change to application directory
cd /vagrant

# composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
composer install
