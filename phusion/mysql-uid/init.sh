#!/bin/sh
if [ -d /var/lib/mysql ]
then
    uid=`stat -c '%u' /var/lib/mysql`
    gid=`stat -c '%u' /var/lib/mysql`

    echo "Updating mysql ids to ($uid:$gid)"

    # Only update the ids if they're not root
    if [ ! $uid -eq 0 ]
    then
        sed -i "s#^mysql:x:.*:.*:#mysql:x:$uid:$gid:#" /etc/passwd
    fi

    if [ ! $gid -eq 0 ]
    then
        sed -i "s#^mysql:x:.*:#mysql:x:$gid:#" /etc/group
    fi

    chown mysql:mysql /var/run/mysqld
fi
