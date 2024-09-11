#!/bin/bash

service mysql start
sleep 10

# Set the MySQL root password and create a test database
mysql --user=root --skip-password <<MYSQL_SCRIPT
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS test_db;
MYSQL_SCRIPT

exec "$@"
