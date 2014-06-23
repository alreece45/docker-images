FROM alreece45/phusion-mysql:latest
MAINTAINER Alexander Reece <alreece45@gmail.com>

ENV HOME /root

COPY ./init.sh /etc/my_init.d/00_fix_uids.sh

RUN rm -rf /build

EXPOSE 80 443
