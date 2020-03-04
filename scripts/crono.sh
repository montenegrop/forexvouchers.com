VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 source /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 workon fxvouchers
cd /var/www/fxvouchers

export DJANGO_SETTINGS_MODULE=forexvouchers.settings.production
FILE=/home/ubuntu/env && test -f $FILE && source $FILE

# write crontab -r to remove crontabs
(crontab -l 2>/dev/null; echo "0 * * * * python manage.py updatenews") | crontab -

#crontab with user
echo -e "$(crontab -u ubuntu -l)\n* * * * * echo 'hello' >> /tmp/2line.txt 2>&1" | crontab -u ubuntu -