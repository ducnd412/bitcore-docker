FROM node:4.9.1
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse" > /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y --force-yes libtool pkg-config build-essential autoconf automake libzmq3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 3001

WORKDIR /home/root
RUN npm install bitcore@4.1.1

RUN echo "Object.defineProperty(global, '_bitcore', { get(){ return undefined }, set(){} })" >> /home/root/node_modules/bitcore/bin/bitcored
CMD ["/home/root/node_modules/bitcore/bin/bitcored"]
