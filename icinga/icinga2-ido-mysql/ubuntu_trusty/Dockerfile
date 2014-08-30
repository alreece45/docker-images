FROM alreece45/ubuntu-icinga2:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup the packages
COPY ./service /opt/icinga2
CMD ["/opt/icinga2/init-ido-mysql.sh"]
