FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./debian_wheezy/packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./debian_wheezy/service /build/php-fpm
RUN /build/php-fpm/setup.sh

CMD ["/opt/init-php-fpm.sh"]

EXPOSE 9000
