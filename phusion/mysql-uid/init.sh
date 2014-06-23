#!/bin/sh
if [ -d /var/lib/mysql ];
then
    uid=`stat -c '%u' /var/lib/mysql`
    gid=`stat -c '%u' /var/lib/mysql``
    
    echo "Updating mysql ids to ($uid:$gid)"
    sed -i "s#^mysql:x:.*:.*:#mysql:x:$uid:$gid:#" /etc/passwd
    sed -i "s#^mysql:x:.*:#mysql:x:$gid:#" /etc/group
fi
