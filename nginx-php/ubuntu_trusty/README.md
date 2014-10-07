nginx configured to work with php-fpm with customizable document root, front controller, and timezone.

The default tags (latest, trusty, etc), only run the nginx container with php run in another container.

Use the runit (runit, runit-trusty, etc) or supervisor tags (supervisor, supervisor-trusty, etc) to 
automatically start php-fpm as well.

When PHP is not bundled (with supervisor or runnit), you can connect to PHP in two ways:

 * Link another container (eg, with `--link php-fpm:php`). Tries port 9000 by default. use `APP_PORT`
   to customize.
 * Socket (via shared volume). The default socket is /var/run/php5-fpm.sock. Use `PHP_SOCKET` to customize.

