#
# TurnkeyLinux Core with Docker installed
#
FROM turnkeylinux/core-14.1:latest
MAINTAINER Ano Tisam "an0tis@gmail.com"

#Install docker
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list.d/sources.list
RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get install docker.io -y

#Allow Remote API Access for GUI tools
RUN echo "DOCKER_OPTS='-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock'" >> /etc/default/docker
RUN service docker restart

#Clean Up
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/usr/sbin/start.sh", "-D", "FOREGROUND"]

#(Optional)Bring in Required images
#RUN docker pull turnkeylinux/lapp-14.1
#RUN docker pull turnkeylinux/lamp-14.1
