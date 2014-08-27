#!/bin/sh
# Setup PHP
sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini

# Configure PHP-FPM to start as a service
cp -a /build/php-fpm/init.sh /opt/init-php-fpm.sh
chmod +x /opt/init-php-fpm.sh
php5enmod mcrypt

# Ensure the mode is correct on the unix socket
sed -i 's#;listen.mode = 0660#listen.mode = 0666#g' /etc/php5/fpm/pool.d/www.conf
