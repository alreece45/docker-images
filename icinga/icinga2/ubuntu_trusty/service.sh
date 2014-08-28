#!/bin/sh

# Run a few checks before staring in the foregronud
# The init script runs these checks when "start" is used
# But does not run them when when "foreground" is used

# Load the user settings 
DAEMON_USER=nagios
DAEMON_GROUP=nagios
DAEMON_CMDGROUP=www-data
. /etc/default/icinga2

# Create the directories and update the permissions
test -d '/var/run/icinga2' || mkdir /var/run/icinga2
chown "$DAEMON_USER":"$DAEMON_GROUP" /var/run/icinga2
chmod 0755 /var/run/icinga2

test -d '/var/run/icinga2/cmd' || mkdir /var/run/icinga2/cmd
chown "$DAEMON_USER":"$DAEMON_CMDGROUP" /var/run/icinga2/cmd
chmod 2710 /var/run/icinga2/cmd

test -d '/var/log/icinga2' || mkdir /var/log/icinga2
chown "$DAEMON_USER":adm /var/log/icinga2
chmod 0761 /var/log/icinga2

exec /etc/init.d/icinga2 foreground
