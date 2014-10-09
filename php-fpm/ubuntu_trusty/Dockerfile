FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./debian_wheezy/packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the service directory and run the setup
COPY ./debian_wheezy/service /opt/php-fpm
COPY ./debian_wheezy/setup.sh /opt/php-fpm-setup.sh
RUN /opt/php-fpm-setup.sh

CMD ["/opt/php-fpm/init.sh"]
