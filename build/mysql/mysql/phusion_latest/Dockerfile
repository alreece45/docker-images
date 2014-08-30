FROM alreece45/phusion-mysql-base:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./phusion_trusty/ubuntu_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./phusion_trusty/service /build/mysql
RUN /build/mysql/setup.sh

CMD ["/sbin/my_init"]

EXPOSE 3306 
