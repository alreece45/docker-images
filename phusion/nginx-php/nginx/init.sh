#!/bin/sh

# Use the TZ environment variable, otherwise use UTC
NGINX_DOCROOT="/var/www"
if [ -n "${DOCROOT}" ]
then
    NGINX_DOCROOT="$DOCROOT"
fi

sed -i "s#root .*;#root $NGINX_DOCROOT;#" /etc/nginx/sites-enabled/default
mkdir -p $NGINX_DOCROOT

if [ -n "${FRONT_CONTROLLER}" ]
then
    sed -i "s#error_page 404 .*;#error_page 404 ${FRONT_CONTROLLER};#" /etc/nginx/sites-enabled/default
    sed -i "s#try_files \$uri \$uri/ /index.html /index.php?\$query_string;#try_files \$uri \$uri/ /index.html /${FRONT_CONTROLLER}?;#" /etc/nginx/sites-enabled/default
fi

