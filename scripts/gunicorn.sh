#!/bin/bash

NAME="fxvouchers"                                  
DJANGODIR=/var/www/fxvouchers             
USER=ubuntu                                        
GROUP=ubuntu                                     
NUM_WORKERS=2                                     
DJANGO_SETTINGS_MODULE=forexvouchers.settings.production            
DJANGO_WSGI_MODULE=forexvouchers.wsgi                     

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH
FILE=/home/ubuntu/env && test -f $FILE && source $FILE


source /usr/local/bin/virtualenvwrapper.sh
workon fxvouchers

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec /home/ubuntu/.virtualenvs/fxvouchers/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --user=$USER --group=$GROUP \
  --log-level=debug \
  --log-file=-