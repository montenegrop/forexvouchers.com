# Installation instructions for development

 1. Clone it and cd to the project dir `git clone git@github.com:ahmerkhanz/fxvouchers.git && cd fxvouchers`
 2. `pip install -r requirements.txt`
 3. `npm install`
 4. Run the following commands in 2 separate terminals: 
    1. `python manage.py runserver`
    2. `npm run watch`

## Technologies used

| Package         | Version |
|-----------------|---------|
| Python          | 3.7     |
| Django          | 2.2     |
| Vue             | 2.6     |
| Bootstrap       | 4.3     |

### Development Admin Login

| Username | password |
|----------|----------|
| admin    | admin    |

### Wagtail plugins
 - [x] [Translations](https://github.com/wagtail/wagtailtrans)
 - [x] [Schema.org JSON-LD](https://github.com/neon-jungle/wagtail-schema.org) 
 - [x] [Autocomplete](https://github.com/wagtail/wagtail-autocomplete) 


### Deployment docs

If you are developing and just want to update your changes to the server, we setted up a deployment script.
You should be able to deploy it by running:

```
ssh fv /var/www/fxvouchers/scripts/git-update.sh
```

For deployment checkout our [Install_Server_Instructions.md](https://github.com/ahmerkhanz/fxvouchers/blob/master/deployment/Install_Server_Instructions.md) steps on `deployment` directory

### Production logs

If python error happens on production you can use these logs:

- For python errors: /var/log/fxvoucher.err.log
- For background jobs: /var/log/forexvouchers-cron.log

### Common issues:

- Cache refresh, Whilst cache is refreshed once you edit a service,  sometimes you might need to make a manual refresh. To do that, enter the server and run `redis-cli FLUSHALL` 
- When opening the website in your dev environment, open `http://localhost:8000/en` cause there won't be an automatic redirect in 
your dev environment from `http://localhost:8000/` to `http://localhost:8000/en`. On production, ngninx takes care of that

