
Container that bootstraps a database on a MySQL server.

Usage
===================

    This container has two primary purposes:

        * Create the database and run scripts to initialize it
        * Create the user and grant permission to the database.

    Example Usage:
    
    docker run --rm --link container-name:mysql \
        -e MYSQL_USER="root" -e MYSQL_PWD=""
        -e DATABASE_NAME="dbname" -e DATABASE_USER="dbuser" -e DATABASE_SQL="/sql/mysqlexport.sql"
        alreece45/phusion-mysql-bootstrap

    These environmental variables are used to configure and initialize the database:

        * `DATABASE`: The name of the database to create (required).
        * `DATABASE_SQL`: Specifies the location of the script, or a directory to use to bootstrap the database. These will be piped into SQL. (gz, bz2, and xz files supported)
        * `DATABASE_BOOTSTRAP`: If specified, this script will be run when the database needs to be created.
        * `DATABASE_DROP`: Drop the database if it already exists.
        * `TEST`: Set to 1 to output the commands that would be run instead of executing them.

    These environmental variables can be used to customize the behavior:

        * `DATABASE`: The name of the database to authorize (required) 
        * `DATABASE_USER`: The name of the user to create (required to create user)
        * `DATABASE_PASSWORD`: The password of the user to create. If unset, one will be generated if needed.
        * `DATABASE_HOST`: The host that the user will be allowed to connect from. Defaults to 172.16.0.0/16 (the same ranger docker users)
        * `USER_BOOTSTRAP`: If specified, this scrip will be run when the user needs to be created instead of the default one.
        * `USER_DROP`: Drop the user if it already exists.
        * `TEST`: Set to 1 to output the commands that would be run instead of executing them.


    MySQL provides several [environmental variables](https://dev.mysql.com/doc/refman/5.6/en/environment-variables.html) 
    that can be used to customize the behavior of the MySQL client.

    This image provides two additional variables to customize the behavior of mysql:

        * `MYSQL_USER`: This allows you to customize the user that will be used. This will be passed as a parameter to MySQL.
        * `MYSQL_OPTS`: This allows additional options to be given to the mysql client.

