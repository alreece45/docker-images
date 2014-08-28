#!/bin/sh
echo " >> Configuring Runit"
mkdir /etc/service/icinga2
cp -av /build/icinga2/runit.sh /etc/service/icinga2/run
chmod +x /etc/service/icinga2/run

# Copy the default icinga configuration
echo " >> Copying the default icinga2 configuration"
cd /etc
tar czvf /etc/icinga2-dist.tgz icinga2 
