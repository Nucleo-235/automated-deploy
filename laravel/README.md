# Angular APP

## Deploy on Hostinger

1 - Setup project (Locally)

1.1 - Download and to base setup to the project (using GIT, ideally using webhooks)

1.2 - Add this content to .gitignore

```
# deploy / server
/deploy
/logs
.env
.htaccess
```

1.3 Download the deploy scripts (inside project folder)

```
git clone https://github.com/Nucleo-235/automated-deploy deploy
```

1.4 - Setup existing composer

```
php deploy/laravel/scripts/add-composer-script.php

```

1.5 - Commit and Push


2 - Setup Git Deploy on Hostinger

3 - Setup Project (server)

3.1 - Update the branch

```
git pull
```

3.2 Download the deploy scripts (inside project folder)

```
git clone https://github.com/Nucleo-235/automated-deploy deploy
```


3.3 - Add this content to .env

```
DEPLOY_ENV="production"
```

3.4 - Add logs folder

```
mkdir logs
```
