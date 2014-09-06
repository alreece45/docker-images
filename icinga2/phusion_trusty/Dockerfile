FROM phusion/baseimage:0.9.13
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the packages
COPY ./setup /opt/icinga2-setup
RUN /opt/icinga2-setup/setup.sh
