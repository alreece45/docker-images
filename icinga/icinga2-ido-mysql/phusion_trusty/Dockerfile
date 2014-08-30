FROM alreece45/phusion-icinga2:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install packages first
COPY ./ubuntu_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the packages
COPY ./ubuntu_trusty/service/configure-ido-mysql.sh /etc/my_init.d/00_icinga2-ido-mysql.sh
