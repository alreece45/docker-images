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

# Check to see if we should get the nginx uid/gid from the document root
if [ "$SYNC_UID" = "1" ]
then
    APP_UID_GID_FROM="$NGINX_DOCROOT"
fi
if [ "$APP_UID_FROM_DOCROOT" = "1" ]
then
    APP_UID_FROM="$NGINX_DOCROOT"
fi
if [ "$APP_GID_FROM_DOCROOT" = "1" ]
then
    APP_GID_FROM="$NGINX_DOCROOT"
fi
if [ "$APP_UID_GID_FROM_DOCROOT" = "1" ]
then
    APP_UID_GID_FROM="$NGINX_DOCROOT"
fi

# Check to see if there's a path to get uid and gid from
if [ -n "$APP_UID_FROM" ]
then
    if [ -n "$APP_UID" ]
    then
        APP_UID=`stat -c '%u' $APP_UID_FROM`
    fi
fi
if [ -n "$APP_GID_FROM" ]
then
    if [ -n "$APP_GID" ]
    then
        APP_GID=`stat -c '%g' $APP_GID_FROM`
    fi
fi
if [ -n "$APP_UID_GID_FROM" ]
then
    if [ -n "$APP_GID" ]
    then
        APP_UID=`stat -c '%u' $APP_UID_GID_FROM`
        APP_GID=`stat -c '%g' $APP_UID_GID_FROM`
    fi
fi

# Change the uid of the www-data user, if specified
if [ -n "$APP_UID" ]
then
    if [ -z "$APP_GID" ]
    then
        APP_GID=`getent group www-data`
    fi
    echo "Updating www-data ids to ($APP_UID:$APP_GID)"

    sed -i "s#^www-data:x:.*:.*:#www-data:x:$APP_UID:$APP_GID:#" /etc/passwd
    sed -i "s#^www-data:x:.*:#www-data:x:$APP_GID:#" /etc/group
    chown www-data /var/log/nginx
fi


exec nginx
