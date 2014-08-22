FROM alreece45/ubuntu-mysql-base:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

# Copy the bootstrap files
COPY ./opt /opt/mysql-bootstrap

CMD ["/opt/mysql-bootstrap/init"]
