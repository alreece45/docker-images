FROM phusion/baseimage:0.9.13
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install packages first
COPY ./installer /opt/icinga2-installer
RUN /opt/icinga2-installer/install.sh

COPY ./setup /opt/icinga2-setup
RUN /opt/icinga2-setup/setup.sh

# Setup the packages
COPY ./service /build/icinga2
RUN /build/icinga2/setup.sh
