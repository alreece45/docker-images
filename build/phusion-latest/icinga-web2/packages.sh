#!/bin/sh
# Set up apt for unattended installation
export DEBIAN_FRONTEND=noninteractive
echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/02apt-speedup

# Install the repository and the packages
apt-add-repository ppa:formorer/icinga
apt-get update
apt-get -y install icinga-web

# Clean up
apt-get clean
rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup
find /tmp /var/tmp -mindepth 2 -delete
