FROM ubuntu:trusty
MAINTAINER Alexander Reece <alreece45@gmail.com>

# Build packages first
COPY ./packages.sh /build/packages.sh
RUN /build/packages.sh

COPY ./service /build/nginx
RUN ./build/nginx/setup.sh

CMD ["/opt/init-nginx.sh"]
