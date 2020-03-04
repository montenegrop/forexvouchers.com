# Creating users
1. adduser ubuntu
2. usermod -aG sudo ubuntu
3. sudo visudo
    ```
        %sudo   ALL=(ALL:ALL) NOPASSWD:ALL

    ```

# Provisioning


1. `sudo apt-get update`
3. Install ubuntu dependencies`sudo apt-get install supervisor python3.7 nginx python3-pip npm libgdal-dev python3.7-dev mysql-server redis-server` 
4. Install virtualenvwrapper `sudo pip3 install virtualenvwrapper`
5. Setup virtualenv wrapper `VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 source /usr/local/bin/virtualenvwrapper.sh`
6. Create virtualenv `VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3 mkvirtualenv fxvouchers --python=/usr/bin/python3.7`

# Setup mysql
1. Setup mysql `sudo mysql_secure_installation`

2. sudo mysql:


    CREATE DATABASE fxvouchers CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
    CREATE USER 'fxvouchers'@'localhost' IDENTIFIED BY 'password!*';
    USE fxvouchers;
    SET FOREIGN_KEY_CHECKS=0;
     import dump.sql # You can get this from the migrations folder
     SET FOREIGN_KEY_CHECKS=1;
    GRANT ALL PRIVILEGES ON fxvouchers.* TO 'fxvouchers'@'localhost';
    SET FOREIGN_KEY_CHECKS=1;
    
mysql -ufxvouchers -p < dump.sql
    
# Download ssh keys
1. Download public keys
2. scp ssh-staging-dir.tar.gz fv
3. tar xvzf ssh-staging-dir.tar.gz

# Prepare log files
1. `sudo touch /var/log/forexvouchers-debug.log`
2. `sudo chmod ugo+rw /var/log/forexvouchers-debug.log`

# Clone repository and install dependencies
1. `sudo mkdir -p /var/www`
2. `sudo chown ubuntu:ubuntu -R /var/www/`
3. `cd /var/www`
4. `git clone git@github.com:ahmerkhanz/fxvouchers.git`

5. `cd /var/www/fxvouchers`
6. `pip install -r requirements.txt`
7. `npm install`
8. `npm run build:static`
9. `gunicorn forexvouchers.wsgi`  And check the logs to see if there are any errors


# Nginx and supervisor
1. scp deployment/supervisor.conf fv:/home/ubuntu
2. scp deployment/nginx-config.conf fv:/home/ubuntu
3. sudo cp supervisor.conf /etc/supervisor/conf.d/forexvouchers.conf
4. sudo cp nginx-config.conf /etc/nginx/sites-enabled/forexvouchers.conf
5. Update /etc/nginx/sites-enabled/forexvouchers.conf with the actual hostname
5. sudo supervisorctl restart all
6. sudo service nginx restart

# Updating existing repository

There's an script in `scripts/django-update.sh` 
That's the script we use to get the latest changes when we deploy. 
You should configure your CI server to run this script everytime you want to deploy.
<<<<<<< Updated upstream
=======

# Update News of homepage hourly

There is an script `scripts/news-update.sh` which is meant to run as a cron task
Run `crontab -e` and then write the following task to run the script hourly
`0 * * * * /var/www/fxvouchers/scripts/news-update.sh`
also
`@hourly /var/www/fxvouchers/scripts/news-update.sh` works too
also
`echo -e "$(crontab -u ubuntu -l)\n1 * * * * /var/www/fxvouchers/scripts/news-update.sh 2>&1" | crontab -u ubuntu -`
writes the task automatically in the cron table

>>>>>>> Stashed changes
