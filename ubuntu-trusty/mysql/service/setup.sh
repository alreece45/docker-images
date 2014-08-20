#!/bin/sh
sed -i "s#^bind-address\s*=\s*.*#bind-address = 0.0.0.0#" /etc/mysql/my.cnf

# Configure mysql to start as a service
mkdir /opt/docker-mysql
cp -a /build/mysql/service.sh /opt/docker-mysql/init
chmod +x /opt/docker-mysql/init

cat /dev/null > /var/log/mysql/error.log
find /build -delete
