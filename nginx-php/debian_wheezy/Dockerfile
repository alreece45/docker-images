FROM alreece45/debian-nginx:wheezy
MAINTAINER Alexander Reece <alreece45@gmail.com>

COPY ./service /build/nginx-php
RUN /build/nginx-php/setup.sh

CMD ["/opt/init-nginx-php.sh"]

EXPOSE 80
