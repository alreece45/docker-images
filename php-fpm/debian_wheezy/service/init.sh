#!/bin/sh -x

# Update the listen address for PHP_FPM
if [ -z "${LISTEN}"]
then
    LISTEN=9000
fi

sed -i "s#^listen = .*#listen = $LISTEN#g" /etc/php5/fpm/pool.d/www.conf

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
    if grep "^env\[$1\]=" /etc/php5/fpm/pool.d/www.conf
    then
        sed -i "s#^env\[$1\]=.*#env[$1]=\"$2\"#g" /etc/php5/fpm/pool.d/www.conf
    else
        echo "env[$1]=\"$2\"" >> /etc/php5/fpm/pool.d/www.conf
    fi
}

for var in `env | egrep -v -f /opt/php-fpm/setup-env | cut -d= -f1`
do
    val=`eval 'echo "$'"$var"'"'`
    echo "Detected enviroment variable $var: $val"
    set_phpfpm_env_var $var $val
done

exec php5-fpm -c /etc/php5/fpm
