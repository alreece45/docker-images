FROM alreece45/ubuntu-mysql-base:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./mysql-bootstrap/packages.sh /build/packages.sh
RUN /build/packages.sh

# Copy the bootstrap files
COPY ./mysql-bootstrap/opt /opt/mysql-bootstrap

CMD ["/opt/mysql-bootstrap/init"]
