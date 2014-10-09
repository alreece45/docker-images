FROM alreece45/ubuntu-nginx:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

COPY ./debian_wheezy/service /build/nginx-php
RUN /build/nginx-php/setup.sh

CMD ["/opt/init-nginx-php.sh"]

EXPOSE 80
