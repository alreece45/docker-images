nginx and php-fpm with configurable document root, front controller, and timezone

Several environmental variables are available to adjust settings

DOCROOT
====================

You can use `DOCROOT` to configure the document root used by nginx.

For example: `DOCROOT=/var/www/html`

TZ
====================

You can use `TZ` to configure the timezone. The php.ini timezone will also be adjusted based on `TZ``

For example: `TZ=America/New_York`

FRONT_CONTROLLER
====================

When using a front controller or "friendly urls", you can use FRONT_CONTROLLER to specify which file to use. 

Set it relative to the document root. For example:

    FRONT_CONTROLLER="app.php"

SYNC_UID
====================

When using volumes on the host system, the UIDs may not match up with the UIDs on the container and may create permission issues.

You may set `SYNC_UID=1` to instruct the container to look at the uid and gid of the DOCROOT and update the www-data uid and gid to match.

In production, the recommended solution is to use volume containers.
