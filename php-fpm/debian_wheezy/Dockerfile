FROM debian:wheezy
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the service directory and run the setup
COPY ./service /opt/php-fpm
COPY ./setup.sh /opt/php-fpm-setup.sh
RUN /opt/php-fpm-setup.sh

CMD ["/opt/php-fpm/init.sh"]
