#!/bin/bash
sudo apt update;
sudo apt install -y apache2 mysql-server;
sudo apt install -y php php-fpm php-mysql;
sudo systemctl restart apache2;

cd /tmp
wget https://wordpress.org/latest.tar.gz;
tar -xvzf latest.tar.gz;
sudo mv wordpress /var/www/html/;

cd
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/wordpress/

sudo mysql -u root -e "create database dbwordpress";
sudo mysql -u root -e "create user 'devopscilsy'@'localhost' identified by '1234567890'";
sudo mysql -u root -e "grant all privileges on *.* to 'devopscilsy'@'localhost'";
sudo mysql -u root -e "flush privileges";

sudo rm -rf /tmp/*
cd /tmp
sudo git clone https://github.com/renaldpputra/wordpress.git
cd wordpress
sudo mv wp-config.php /var/www/html/wordpress/

sudo cp -f 000-default.conf /etc/apache2/sites-available/
cd
sudo systemctl restart apache2;



