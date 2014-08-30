FROM phusion/baseimage:0.9.13
MAINTAINER Alexander Reece <alreece45@gmail.com>

ENV HOME /root

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./nginx /build/nginx
RUN /build/nginx/setup.sh

COPY ./php-fpm /build/php-fpm
RUN /build/php-fpm/setup.sh

RUN rm -rf /build

EXPOSE 80 443
