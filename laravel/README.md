# Angular APP

## Deploy on Hostinger

1 - Setup project

1.1 - Download and to base setup to the project (using GIT, ideally using webhooks)

1.2 - Add this content to .gitignore

```
# deploy / server
/deploy
/logs
.env
.htaccess
```

2 - Download the deploy scripts (inside project folder)

2.1 - Download

`git clone https://github.com/Nucleo-235/automated-deploy deploy`

2.2 - Add this content to .env

```
DEPLOY_ENV="production"
```

3 - Setup existing composer

```
php deploy/laravel/scripts/add-composer-script.php

```
