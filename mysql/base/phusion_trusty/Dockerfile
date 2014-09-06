FROM phusion/baseimage:0.9.13
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./ubuntu_trusty/installer /opt/mysql-client-installer
RUN /opt/mysql-client-installer/install.sh
