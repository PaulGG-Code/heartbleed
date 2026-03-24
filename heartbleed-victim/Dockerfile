FROM --platform=linux/amd64 dorowu/ubuntu-desktop-lxde-vnc:bionic

LABEL maintainer="Rajesh Kalyanam <rkalyanapurdue@gmail.com>"

#create a non-root user
RUN useradd -d /home/victim -m -s /bin/bash victim

RUN echo 'victim:victim' | chpasswd

ENV USER=victim \
    PASSWORD=victim 

