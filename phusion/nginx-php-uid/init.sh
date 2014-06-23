#!/bin/sh
if [ -d $DOCROOT ];
then
    uid=`stat -c '%u' $DOCROOT`
    gid=`stat -c '%u' $DOCROOT`
    
    echo "Updating www-data ids to ($uid:$gid)"
    sed -i "s#^www-data:x:.*:.*:#www-data:x:$uid:$gid:#" /etc/passwd
    sed -i "s#^www-data:x:.*:#www-data:x:$gid:#" /etc/group
fi
