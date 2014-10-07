#!/bin/sh -x

# Use the TZ environment variable, otherwise use UTC
NGINX_DOCROOT="/usr/share/nginx/html"
if [ -n "${DOCROOT}" ]
then
    NGINX_DOCROOT="$DOCROOT"
fi

# Update the document root configuration, create the document root if needed
sed -i "s#root .*;#root $NGINX_DOCROOT;#" /etc/nginx/sites-enabled/default
mkdir -p $NGINX_DOCROOT

if [ -n "$SYNC_UID" ] && [ $SYNC_UID -eq 1 ]
then
    uid=`stat -c '%u' $NGINX_DOCROOT`
    gid=`stat -c '%g' $NGINX_DOCROOT`

    echo "Updating www-data ids to ($uid:$gid)"

    if [ ! $uid -eq 0 ]
    then
        sed -i "s#^www-data:x:.*:.*:#www-data:x:$uid:$gid:#" /etc/passwd
    fi

    if [ ! $gid -eq 0 ]
    then
        sed -i "s#^www-data:x:.*:#www-data:x:$gid:#" /etc/group
    fi

    chown www-data /var/log/nginx
fi
exec nginx
