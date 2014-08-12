#!/bin/sh
sed -i "s#^bind-address\s*=\s*.*#bind-address = 0.0.0.0#" /etc/mysql/my.cnf

# Configure init script to run on startup
cp -a /build/mysql/init.sh /etc/my_init.d/00_configure_mysql.sh
chmod +x /etc/my_init.d/00_configure_mysql.sh

# Configure mysql to start as a service
mkdir /etc/service/mysql
cp -a /build/mysql/runit.sh /etc/service/mysql/run
chmod +x /etc/service/mysql/run

cat /dev/null > /var/log/mysql/error.log
