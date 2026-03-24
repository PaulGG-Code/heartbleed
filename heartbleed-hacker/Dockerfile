FROM --platform=linux/amd64 dorowu/ubuntu-desktop-lxde-vnc:bionic

LABEL maintainer="Rajesh Kalyanam <rkalyanapurdue@gmail.com>"

#add Python
RUN apt-get update && apt-get -y install python

#create a non-root user
RUN useradd -d /home/hacker -m -s /bin/bash hacker

RUN echo 'hacker:hacker' | chpasswd

ADD . /home/hacker

ENV USER=hacker \
    PASSWORD=hacker 

