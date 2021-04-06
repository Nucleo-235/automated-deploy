# Ionic Capacitor APP

## Deploy on Hostinger

1 - Setup project (locally)

1.1 - Download and to base setup to the project (using GIT, ideally using webhooks)

1.2 - Add this content to .gitignore

```
# deploy / server
/deploy
/logs
.env
.htaccess
```

1.3 - Download the deploy scripts (inside project folder)

```
git clone https://github.com/Nucleo-235/automated-deploy deploy
```

1.4 - Setup composer

1.4.1 Copy the base-composer.json as composer.json

```
cp deploy/ionic-capacitor/base-composer.json composer.json
```

1.4.2 Change the composer.json meta description properties

2 - Setup server

2.1 - Setup Git Deploy on Hostinger

- Setup Git Deploy
- Setup webhook on your git repository
- Run for the first time (to download)

2.2 - Add Deploy scripts

`git clone https://github.com/Nucleo-235/automated-deploy deploy`

2.3 - Setup server environemtn

2.3.1 - Add this content to .env

```
DEPLOY_ENV="production"
BASE_HREF="/"
WEBSITE_FOLDER="/website/path/"
```

2.3.2 - Create logs folder

```
mkdir logs
```

3 - Install NVM

3.1 - Base Installation

[Tutorial Hostinger](https://www.hostinger.com.br/tutoriais/instalar-node-js-ubuntu)

Run this script:
`wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash`

Run the command `nvm install` to install

3.2 - Setup bash profile

Add this content to ~/.bash_profile (if it is not already there)

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
```
