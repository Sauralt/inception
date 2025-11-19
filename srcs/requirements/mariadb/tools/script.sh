#! /bin/bash

service mariadb start

local DATABASE_NAME=$(cat $SECRETS_PREFIX/database_name)
local DATABASE_USER_NAME=$(cat $SECRETS_PREFIX/database_user_name)
local DATABASE_USER_PASSWORD=$(cat $SECRETS_PREFIX/database_user_password)
local DATABASE_ROOT_PASSWORD=$(cat $SECRETS_PREFIX/database_root_password)

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${DATABASE_USER_NAME}'@'%' IDENTIFIED BY '${DATABASE_USER_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO '${DATABASE_USER_NAME}'@'%';"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DATABASE_ROOT_PASSWORD}';"

mariadbadmin -u root -p$DATABASE_ROOT_PASSWORD shutdown
exec mariadb_safe