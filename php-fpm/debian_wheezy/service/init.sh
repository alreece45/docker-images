#!/bin/sh -x

cd `dirname $0`

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

. ./configure-fpm-environment.sh

exec php5-fpm -c /etc/php5/fpm
