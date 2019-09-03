VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 source /usr/local/bin/virtualenvwrapper.sh
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 workon fxvouchers
cd /var/www/fxvouchers
git fetch origin master
git checkout --force master
git reset --hard origin/master
FILE=/home/ubuntu/env && test -f $FILE && source $FILE
echo "test $MYSQL_DATABASE_NAME"


pip install -r requirements.txt
npm install
npm run build:static
python manage.py migrate
sudo supervisorctl restart all