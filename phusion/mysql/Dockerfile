FROM phusion/baseimage:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

ENV HOME /root

VOLUME /var/lib/mysql

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./mysql /build/mysql
RUN /build/mysql/setup.sh 

RUN rm -rf /build

CMD ["/sbin/my_init"]

EXPOSE 3306 
