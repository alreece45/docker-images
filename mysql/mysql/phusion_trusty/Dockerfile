FROM alreece45/phusion-mysql-base:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./installer /opt/mysql-installer
RUN /opt/mysql-installer/install.sh

COPY ./setup /opt/mysql-setup
RUN /opt/mysql-setup/setup.sh \
      && find /opt/mysql-setup -print -delete

CMD ["/sbin/my_init"]

EXPOSE 3306
