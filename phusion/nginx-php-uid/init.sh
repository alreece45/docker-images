#!/bin/sh
if [ -d $DOCROOT ];
then
    uid=`stat -c '%u' $DOCROOT`
    gid=`stat -c '%u' $DOCROOT`
    
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
