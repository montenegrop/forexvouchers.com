
# Provisioning
sudo apt-get update
sudo apt upgrade -y
sudo apt-get install supervisor python3.7 ruby-sass nginx
sudo pip3 install virtualenvwrapper
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 mkvirtualenv fxvouchers --python=/usr/bin/python3.7

mkdir -p /var/www

sudo chown ubuntu:ubuntu -R /var/www/
cd /var/www
git clone git@github.com:ahmerkhanz/fxvouchers.git

gunicorn forexvouchers.wsgi


# Updating existing repository

VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 workon fxvouchers
cd /var/www/fxvouchers
git fetch --all
git checkout --force master

pip install -r requirements.txt

gunicorn==19.9

