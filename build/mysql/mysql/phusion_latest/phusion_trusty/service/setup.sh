#!/bin/sh
/build/mysql/ubuntu-setup.sh

# Configure mysql to start as a service
mkdir /etc/service/mysql
cp -a /build/mysql/service.sh /etc/service/mysql/run
chmod +x /etc/service/mysql/run

cat /dev/null > /var/log/mysql/error.log
find /build -delete
