# Angular APP

## Deploy on Hostinger

1 - Download the project (using GIT)

2 - Download the deploy scripts (inside project folder)

3 - Setup composer

3.1 Copy the base-composer.json as composer.json

3.2 Change the composer.json meta description properties

4 - Install NVM

[Tutorial Hostinger](https://www.hostinger.com.br/tutoriais/instalar-node-js-ubuntu)

Run this script:
`wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash`

5 - Setup bash profile

Add this content to ~/.bash_profile (if it is not already there)

`
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
`

6 - Install and setup node version

6.1 Go to the project folder

6.2 Run the command `nvm install` to install

7 - Setup environment

Add this content to .env

`
DEPLOY_ENV="production"
BASE_HREF="/"
WEBSITE_FOLDER="/website/path/"
`
