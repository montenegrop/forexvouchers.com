VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 source /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 workon fxvouchers
cd /var/www/fxvouchers

export DJANGO_SETTINGS_MODULE=forexvouchers.settings.production
FILE=/home/ubuntu/env && test -f $FILE && source $FILE


python manage.py updatenews