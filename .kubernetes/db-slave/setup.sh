#!/bin/bash

MASTER_HOST = 'db-master'
MASTER_USER = 'replication'
MASTER_PASSWORD = 'password'

# Master立ち上がりまでのインターバル
until mysqladmin ping -h master --silent; do
  sleep 1
done

MASTER_LOG_FILE = `mysql -u root -h ${MASTER_HOST} -e 'SHOW MASTER STATUS \G' | grep File: | awk '{print $2}'`
MASTER_LOG_POS  = `mysql -u root -h ${MASTER_HOST} -e 'SHOW MASTER STATUS \G' | grep Position: | awk '{print $2}'`

mysql -u root -e "INSTALL PLUGIN rpl_semi_sync_slave SONAME 'semisync_slave.so'"
mysql -u root -e "CHANGE MASTER TO MASTER_HOST='${MASTER_HOST}', MASTER_USER='${MASTER_USER}', MASTER_PASSWORD='${MASTER_PASSWORD}', MASTER_LOG_FILE='${MASTER_LOG_FILE}', MASTER_LOG_POS=${MASTER_LOG_POS}"
mysql -u root -e 'START SLAVE'
