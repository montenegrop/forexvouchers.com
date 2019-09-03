# Provisioning
sudo apt-get update
#sudo apt upgrade -y
sudo apt-get install supervisor python3.7 nginx python3-pip npm libgdal-dev python3.7-dev mysql-server 
sudo pip3 install virtualenvwrapper
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 source /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 mkvirtualenv fxvouchers --python=/usr/bin/python3.7

sudo mysql_secure_installation
sudo mysql:
    CREATE DATABASE fxvouchers CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE USER 'fxvouchers'@'localhost' IDENTIFIED BY 'password!*';
    USE fxvouchers;
    SET FOREIGN_KEY_CHECKS=0;
     import dump.sql
     SET FOREIGN_KEY_CHECKS=1;
    GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, CREATE TEMPORARY TABLES, LOCK TABLES ON fxvouchers.* TO 'fxvouchers'@'localhost';
    SET FOREIGN_KEY_CHECKS=1;
    
mysql -ufxvouchers -p < dump.sql
    
sudo mkdir -p /var/www

sudo chown ubuntu:ubuntu -R /var/www/
cd /var/www
git clone git@github.com:ahmerkhanz/fxvouchers.git

pip install -r requirements.txt
npm install
npm run build:static
gunicorn forexvouchers.wsgi


# Updating existing repository
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 source /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 workon fxvouchers
cd /var/www/fxvouchers
git fetch origin master
git checkout --force master
git reset --hard origin/master

pip install -r requirements.txt
npm install
npm run build:static

gunicorn forexvouchers.wsgi


