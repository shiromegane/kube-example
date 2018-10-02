#!/bin/bash

REPLICATION_USER_NAME = 'replication'
REPLICATION_USER_PASSWORD = 'password'

mysql -u root -e "GRANT REPLICATION SLAVE ON *.* TO '${REPLICATION_USER_NAME}'@'%' IDENTIFIED BY '${REPLICATION_USER_PASSWORD}'"
mysql -u root -e "INSTALL PLUGIN rpl_semi_sync_master SONAME 'semisync_master.so'"
