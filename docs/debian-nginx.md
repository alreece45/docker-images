nginx with a configurable document root and configurable uid and gid permissions.

Potential Volumes
===

  * `/var/log/nginx` is the default logging directory
  * `/etc/nginx` is the configuration directory

Options
===

You can customize the image behavior using environmental variables
arguments.

Environmental Variable       | Description
-----------------------------|-----------------------------
DOCROOT="*[path]*"           | Configures the document root of nginx, defaults to /usr/share/nginx/html
APP_UID_GID_FROM_DOCROOT="1" | Update the uid and gid of www-data to the uid and gid owners of the the document root. Nginx will run as this uid and gid.
APP_UID_FROM_DOCROOT="1"     | Update the uid of www-data to the uid owners of the the document root. Nginx will run as this uid.
APP_GID_FROM_DOCROOT="1"     | Update the gid of www-data to the gid owners of the the document root. Nginx will run as this gid.
APP_UID_GID_FROM="*[path]*"  | Update the uid and gid of www-data to the uid and gid owners of the the specified path. Nginx will run as this uid and gid
APP_UID_FROM="*[path]*"      | Update the uid of www-data to uid owner the specified path. Nginx will run as this uid.
APP_GID_FROM="*[path]*"      | Update the gid of www-data to gid owner the specified path. Nginx will run as this gid.
APP_UID="*[uid]*"            | Update the uid of www-data to this uid. Nginx will run as this uid.
APP_GID="*[gid]*"            | Update the gid of www-data to this gid. Nginx will run as this gid.
