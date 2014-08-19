Docker Images
====================

Collection of various docker images I've created.

Images
----------

 * **nginx-php** Image for running nginx and php-fpm

   ([phusion-latest](https://github.com/alreece45/docker-images/tree/master/phusion-latest/nginx-php), 
   [phusion-trusty](https://github.com/alreece45/docker-images/tree/master/phusion-trusty/nginx-php))
   
 * **mysql** Image for running a MySQL Server

   ([phusion-latest](https://github.com/alreece45/docker-images/tree/master/phusion-latest/mysql), 
   [phusion-trusty](https://github.com/alreece45/docker-images/tree/master/phusion-trusty/mysql), 
   [ubuntu-trusty](https://github.com/alreece45/docker-images/tree/master/ubuntu-trusty/mysql))
   
 * **mysql-bootstrap** Image for bootstraping databases and users on linked containers.

   ([phusion-latest](https://github.com/alreece45/docker-images/tree/master/phusion-latest/mysql-bootstrap), 
   [phusion-trusty](https://github.com/alreece45/docker-images/tree/master/phusion-trusty/mysql-bootstrap))
   
 * **icinga2** Image for bootstraping databases and users on linked containers.

   ([phusion-latest](https://github.com/alreece45/docker-images/tree/master/phusion-latest/icinga2), 
   [phusion-trusty](https://github.com/alreece45/docker-images/tree/master/phusion-trusty/icinga2), 
   [ubuntu-trusty](https://github.com/alreece45/docker-images/tree/master/ubuntu-trusty-latest/icinga2))

 * **ssh-keygen** Create SSH keys and add them to authorized_keys files.
   ([ubuntu-trusty](https://github.com/alreece45/docker-images/tree/master/ubuntu-trusty/ssh-keygen))

Building
----------

All of these images are available on the Docker Registry. However, because some
images use common/shared code, please note these instructions for building.

The "build" branch (or branches ending with "-build" container a build/ directory.
The Dockerfiles in that directory may be built normally (using `docker build .` 
or similar)

However, Docker doesn't yet support sharing resources across multiple Dockerfiles.
A recent version of Docker (1.1) added the ability to build an image from a tar file. 
In this repository, image direcotires container symlinks exist to the relevant  content.
For security reasons, Docker does not dereference/copy these symlinks. To build the
images manually, use the following command to dereference the symlinks using tar 
and send it to docker build

    # Docker 1.1 or higher required
    tar cvf - . -h | docker build -

Before building, we recommend you review the symlinks in the directory.
(`find -type l -print0 | xargs -0 ls -l` should show the symlinks of the current directory
on GNU systems).
