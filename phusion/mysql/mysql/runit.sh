#!/bin/sh
INIT_MYSQL=0
if [ ! -d /var/lib/mysql/mysql ]
then
     mysql_install_db --user=mysql
     INIT_MYSQL=1
fi

MYSQL_OPTS=""

if [ $INIT_MYSQL -eq 1 ]
then
    if [ ! -e "$ADMIN_USER" ]
    then
        ADMIN_USER="admin"
    fi

    if [ ! -e "$ADMIN_HOST" ]
    then
        ADMIN_HOST="172.16.0.0/255.240.0.0"
        echo "Allowing connections to user '$ADMIN_USER' from $ADMIN_HOST"
    fi

    if [ ! -e "$ADMIN_PASS" ]
    then
        ADMIN_PASS=$(pwgen -s 12 1)
        echo "Generated password for user '$ADMIN_USER': $ADMIN_PASS"
    fi

    touch /tmp/mysql-init.sql
    chown root:mysql /tmp/mysql-init.sql
    chmod 740 /tmp/mysql-init.sql

    echo "GRANT ALL ON *.* TO '$ADMIN_USER'@'$ADMIN_HOST' IDENTIFIED BY '$ADMIN_PASS' WITH GRANT OPTION;" > /tmp/mysql-init.sql
    echo "DELETE FROM mysql.user WHERE user != 'root' ;" >> /tmp/mysql-init.sql
    echo "DROP DATABASE IF EXISTS test;" >> /tmp/mysql-init.sql
    echo "FLUSH PRIVILEGES;" >> /tmp/mysql-init.sql

    cat /tmp/mysql-init.sql

    MYSQL_OPTS=" --init-file=/tmp/mysql-init.sql"
fi

/usr/bin/mysqld_safe $MYSQL_OPTS &
sleep 10

if [ -f /tmp/mysql-init.sql ]
then
    rm /tmp/mysql-init.sql
fi
wait
