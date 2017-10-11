#!/bin/bash
set -e

# /acs/acsstart
while :
do
  if [ -f /acs/conf/ews_startup.sh ]; then
      chmod a+x /acs/conf/ews_startup.sh
      /acs/conf/ews_startup.sh
      echo "success"
  else
    echo "failure 'startup.sh' not exists"
  fi
  sleep 30
done

