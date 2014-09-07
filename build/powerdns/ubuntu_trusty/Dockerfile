FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the init script
COPY ./init.sh /opt/init-pdns.sh
CMD ["/opt/init-pdns.sh"]

EXPOSE 53/udp 53/tcp
