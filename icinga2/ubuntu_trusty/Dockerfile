FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install packages first
COPY ./installer /opt/icinga2-installer
RUN /opt/icinga2-installer/install.sh

# Setup the packages
COPY ./service.sh /opt/icinga2-init.sh
CMD ["/opt/icinga2-init.sh"]
