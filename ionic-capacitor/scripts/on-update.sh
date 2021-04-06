#!/bin/sh

log_file="logs/deploy-$(date +"%F").log"
echo "---- STARTING ON-UPDATE (V1.0): $(date +"%F-%H-%M-%S")" >> $log_file
echo "  PWD: $PWD"  >> $log_file
echo "  DEPLOY_ENV: $DEPLOY_ENV"  >> $log_file

SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "  SCRIPTS_DIR: $SCRIPTS_DIR"  >> $log_file

if [ "$DEPLOY_ENV" = "production" ]; then
  echo "   ON-UPDATE: BASH" >> $log_file
  touch ~/.bash_profile && source ~/.bash_profile

  echo "   ON-UPDATE: NVM" >> $log_file
  nvm use >> $log_file

  echo "   ON-UPDATE: deploy" >> $log_file
  . "${SCRIPTS_DIR}/deploy-linked.sh" $log_file

  echo "   ON-UPDATE: deployed" >> $log_file
else
  echo "   ON-UPDATE: NOT proper ENV" >> $log_file
fi
echo "---- END ON-UPDATE: $(date +"%F-%H-%M-%S")" >> $log_file
