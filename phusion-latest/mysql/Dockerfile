FROM alreece45/phusion-mysql-base:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

EXPOSE 3306 
VOLUME ["/var/log/mysql", "/var/lib/mysql"]

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./mysql /build/mysql
RUN /build/mysql/setup.sh 

CMD ["/sbin/my_init"]
