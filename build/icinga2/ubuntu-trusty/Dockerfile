FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the packages
COPY ./service.sh /opt/icinga2-init.sh
CMD ["/opt/icinga2-init.sh"]
