FROM alreece45/ubuntu-mysql-base:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./service /build/mysql
RUN /build/mysql/setup.sh

CMD ["/opt/docker-mysql/init"]

EXPOSE 3306
