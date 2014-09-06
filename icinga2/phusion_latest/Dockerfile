FROM phusion/baseimage:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install packages first
COPY ./phusion_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the packages
COPY ./phusion_trusty/setup /opt/icinga2-setup
RUN /opt/icinga2-setup/setup.sh
