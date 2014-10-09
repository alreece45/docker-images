php-fpm that configures the timezone, imports environmental variables, and
allows customizing the uid and gid of the user.

Options
===

You can customize the image behavior using environmental variables
arguments.

Environmental Variable       | Description
-----------------------------|-----------------------------
TZ                           | Configures the timezone in php.ini. Example `TZ=America/New_York`
APP_UID_GID_FROM_ROOT="1"    | Update the uid and gid of www-data to the uid and gid owners of the the document root. Nginx will run as this uid and gid.
APP_UID_FROM_ROOT="1"        | Update the uid of www-data to the uid owners of the the document root. Nginx will run as this uid.
APP_GID_FROM_ROOT="1"        | Update the gid of www-data to the gid owners of the the document root. Nginx will run as this gid.
APP_UID_GID_FROM="*[path]*"  | Update the uid and gid of www-data to the uid and gid owners of the the specified path. Nginx will run as this uid and gid
APP_UID_FROM="*[path]*"      | Update the uid of www-data to uid owner the specified path. Nginx will run as this uid.
APP_GID_FROM="*[path]*"      | Update the gid of www-data to gid owner the specified path. Nginx will run as this gid.
APP_UID="*[uid]*"            | Update the uid of www-data to this uid. Nginx will run as this uid.
APP_GID="*[gid]*"            | Update the gid of www-data to this gid. Nginx will run as this gid.
