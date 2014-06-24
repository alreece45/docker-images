#!/bin/sh

# Use the TZ environment variable, otherwise use UTC
PHP_TIMEZONE="UTC"
if [ -n "${TZ}" ]
then
    PHP_TIMEZONE="$TZ"
fi

find /etc/php5 -name php.ini -print0 | xargs -0 sed -i "s#;date.timezone =.*#date.timezone = $PHP_TIMEZONE#"

# Add environment variables to the php-fpm configuration
# Based on startup.sh from https://github.com/dubture-dockerfiles/nginx-php
set_phpfpm_env_var() {
    if [ -z "$2" ]
    then
            echo "Environment variable '$1' not set."
            return
    fi

    # Check whether variable already exists
    if grep "env[$1]" /etc/php5/fpm/pool.d/www.conf
    then
        sed -i "s#^env\[$1.*#env[$1] = $2#g" /etc/php5/fpm/pool.d/www.conf
    else
        echo "env[$1] = $2" >> /etc/php5/fpm/pool.d/www.conf
    fi
}

# Grep for variables that look like docker set them (_PORT_)
for _var in `env | grep _PORT_ | awk -F = '{print $1}'`
do
    eval _val=\$$_var
    set_phpfpm_env_var $_var $_val
done
