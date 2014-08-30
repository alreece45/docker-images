FROM phusion/baseimage:0.9.13
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./ubuntu_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh
