FROM alreece45/phusion-mysql-base:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./ubuntu_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./service /build/mysql
RUN /build/mysql/setup.sh

CMD ["/sbin/my_init"]

EXPOSE 3306
