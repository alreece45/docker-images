FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./debian_wheezy/installer/ /opt/postfix-installer
RUN /opt/postfix-installer/install.sh

# Copy the init script and set the entrypoint
COPY ./debian_wheezy/service.sh /opt/init-postfix.sh
ENTRYPOINT ["/opt/init-postfix.sh"]
EXPOSE 25
