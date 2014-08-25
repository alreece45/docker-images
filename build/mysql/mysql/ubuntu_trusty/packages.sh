#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/02apt-speedup
apt-get update
apt-get --no-install-recommends -y install mysql-server pwgen

# Remove the mysql directory
# Will initilize it later when the container is configured
# (but not if the directory is populated)
find /var/lib/mysql -mindepth 1 -delete -print

# Cleanup
apt-get clean
rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup
find /var/lib/apt/lists -mindepth 1 -delete -print
find /tmp /var/tmp -mindepth 2 -delete -print
find /build -delete
