FROM phusion/baseimage:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./ubuntu_trusty/installer /opt/mysql-client-installer
RUN /opt/mysql-client-installer/install.sh
