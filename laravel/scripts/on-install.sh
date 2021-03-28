#!/bin/sh

isCommandAvailable () {
  if [[ -x "$(command -v ${1})" ]] ; then return 0 ; fi
  return 1
}

log_file="logs/deploy-laravel-$(date +"%F").log"
echo "---- STARTING ON-INSTALL (V1.0): $(date +"%F-%H-%M-%S")" >> $log_file

if isCommandAvailable "cghooks" ; then
  echo "   ON-INSTALL: CGHOOKS" >> $log_file
  cghooks add --ignore-lock >> $log_file
fi

echo "---- END ON-INSTALL: $(date +"%F-%H-%M-%S")" >> $log_file
