# Creating users
adduser ubuntu
usermod -aG sudo ubuntu

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
    GRANT ALL PRIVILEGES ON fxvouchers.* TO 'fxvouchers'@'localhost';
    SET FOREIGN_KEY_CHECKS=1;
    
mysql -ufxvouchers -p < dump.sql
    
# Download ssh keys
1. Download public keys
2. scp ssh-staging-dir.tar.gz fv
3. tar xvzf ssh-staging-dir.tar.gz

# Prepare log files
1. sudo touch /var/log/forexvouchers-debug.log
2. sudo chmod ugo+rw /var/log/forexvouchers-debug.log

# Clone repository and install dependencies
sudo mkdir -p /var/www
sudo chown ubuntu:ubuntu -R /var/www/

cd /var/www
git clone git@github.com:ahmerkhanz/fxvouchers.git

cd /var/www/fxvouchers
pip install -r requirements.txt
npm install
npm run build:static
gunicorn forexvouchers.wsgi


# Nginx and supervisor
1. scp deployment/supervisor.conf fv:/home/ubuntu
2. scp deployment/nginx-config.conf fv:/home/ubuntu
3. sudo cp supervisor.conf /etc/supervisor/conf.d/forexvouchers.conf
4. sudo cp nginx-config.conf /etc/nginx/sites-enabled/forexvouchers.conf
5. Update /etc/nginx/sites-enabled/forexvouchers.conf with the actual hostname
5. sudo supervisorctl restart all
6. sudo service nginx restart



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


