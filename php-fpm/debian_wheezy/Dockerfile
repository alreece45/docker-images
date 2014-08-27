FROM debian:wheezy
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./service /build/php-fpm
RUN /build/php-fpm/setup.sh

CMD ["/opt/init-php-fpm.sh"]

EXPOSE 9000
