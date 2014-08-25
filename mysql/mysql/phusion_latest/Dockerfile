FROM alreece45/phusion-mysql-base:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

EXPOSE 3306 

# Build packages first
COPY ./phusion_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./phusion_trusty/service /build/mysql
RUN /service/mysql/setup.sh 

CMD ["/sbin/my_init"]
