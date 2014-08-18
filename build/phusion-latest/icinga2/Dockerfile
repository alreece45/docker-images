FROM phusion/baseimage:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

ENV HOME /root

# Install packages first
COPY ./phusion-trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the packages
COPY ./phusion-trusty/icinga2 /build/icinga2
RUN /build/icinga2/setup.sh

VOLUME ["/etc/icinga2"]
