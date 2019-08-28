
# Provisioning
sudo apt-get update
#sudo apt upgrade -y
sudo apt-get install supervisor python3.7 nginx python3-pip npm libgdal-dev python3.7-dev 
sudo pip3 install virtualenvwrapper
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 source /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 mkvirtualenv fxvouchers --python=/usr/bin/python3.7

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


