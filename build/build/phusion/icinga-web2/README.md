Icinga2 Web
====================

The icinga2 web interface is set up to run in a seperate container. 

External Commands and SSH
--------------------

External commands in icinga2 are only accepted using a local pipe. Icinga Web 
includes an option to use SSH to send external commands. You can use links to
connect with the icinga2 container's ssh. 

To avoid errors, use a volume to store SSH's configuration and private keys. We
recommend you keep this volume private and seperate from the icinga2 configuration.

The SSH volume will need to include the sshd configuration. The following will
set up a new data volume and create the configuration:

    docker run -v /etc/icinga2 -v /var/log/icinga2 -v /etc/ssh --name data-icinga2-private busybox
    docker run --rm --volumes-from data-icinga2-private alreece45/ubuntu-ssh-volume
    
Remove the old icinga2 container and create a new container the new data volume:

	docker rm -f icinga2
    docker run --volumes-from data-icinga2 --volumes-from data-icinga2-private --name icinga2 alreece45/icinga2
    
Now the SSH keys on the server are persistant and private.


Database (MySQL or Postgre)
--------------------

A database is not included in the image. You'll need to link either a mysql or 
postgre container AND provide authentication credentials (`MYSQL_USER`, 
`MYSQL_PASSWORD`, `POSTGRE_USER`, `POSTGRE_PASSWORD`)
