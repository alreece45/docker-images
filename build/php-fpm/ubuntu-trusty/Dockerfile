FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./service.sh /opt/docker-php-fpm/init
CMD ["/opt/docker-php-fpm/init"]
