# DOCKER-VERSION 0.6.4

FROM ubuntu:12.04

RUN echo deb http://archive.ubuntu.com/ubuntu precise main universe multiverse > /etc/apt/sources.list
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

ADD . /src
RUN cd /src && npm install

EXPOSE 3000
CMD ["node", "/src/app.js"]
