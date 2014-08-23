FROM alreece45/phusion-mysql-base:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./ubuntu_trusty/packages.sh /build/packages.sh
RUN /build/packages.sh

# Copy the bootstrap files
COPY ./ubuntu_trusty/opt /opt/mysql-bootstrap

CMD ["/opt/mysql-bootstrap/init"]
