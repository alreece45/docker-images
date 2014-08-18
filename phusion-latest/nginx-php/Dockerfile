FROM phusion/baseimage:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

ENV HOME /root

# Build packages first
COPY ./phusion-trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./phusion-trusty/nginx /build/nginx
RUN /build/nginx/setup.sh

COPY ./phusion-trusty/php-fpm /build/php-fpm
RUN /build/php-fpm/setup.sh

RUN rm -rf /build

EXPOSE 80 443
