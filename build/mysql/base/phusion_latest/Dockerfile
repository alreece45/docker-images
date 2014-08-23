FROM phusion/baseimage:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./ubuntu_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh
