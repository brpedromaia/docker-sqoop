#!/bin/bash
#. /etc/bootstrap.sh

# Dependecy validation

while ! nc -z yarn 8088;
      do
        echo Waiting yarn...;
        sleep 1;
      done;
      echo Connected!;
while hdfs dfs -test -e /landing/oracle;
      do
        echo Waiting oracle...;
        sleep 1;
      done;
      echo Connected!;

set -euf -o pipefail

mkdir -p /home/sqoop/teste/
echo "make fake files: env_configuration.xml"
echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?><configuration></configuration>'>> /home/sqoop/teste/env_configuration.xml
echo "make fake files: log4j.properties"
echo ''>> /home/sqoop/teste/log4j.properties



echo "Sqoop success!"

##
## Workaround for graceful shutdown. ....ing Sqoop... ‿( ́ ̵ _-`)‿
##
  while [ '' == '' ]; do
    sleep 1
    
  done
  ;;
