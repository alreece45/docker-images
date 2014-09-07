FROM phusion/baseimage:0.9.13
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Install and configure packages
COPY ./debian_wheezy/installer /opt/postfix-installer
RUN /opt/postfix-installer/install.sh

# Run the setup to configure runit
COPY ./setup /opt/postfix-setup
RUN /opt/postfix-setup/setup.sh \
    && find /opt/postfix-setup -delete -print

CMD ["/sbin/my_init"]

EXPOSE 25
