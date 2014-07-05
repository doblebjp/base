#!/usr/bin/env bash

# update package list
apt-get update

# apache
apt-get install -y apache2
rm -rf /var/www/html
ln -fs /vagrant/web /var/www/html

# php
apt-get install -y php5 php-apc php5-mysql

# mysql
DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# curl
apt-get install -y curl

# composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
