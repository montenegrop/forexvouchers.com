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

For deployment checkout our [https://github.com/ahmerkhanz/fxvouchers/blob/master/deployment/Install_Server_Instructions.md](Install_Server_Instructions.md) steps on `deployment` directory

