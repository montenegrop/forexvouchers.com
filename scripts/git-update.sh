cd /var/www/fxvouchers
git fetch origin master
git checkout --force master
git reset --hard origin/master

source ./django-update.sh