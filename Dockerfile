FROM node:4.9
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe restricted multiverse" > /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y --force-yes libtool pkg-config build-essential autoconf automake libzmq-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN npm install -g bitcore@4.1.1
RUN ln -s /usr/local/lib/node_modules/bitcore/node_modules/bitcore-node/bin/bitcoind /usr/local/bin
WORKDIR /bitcoin
COPY bitcoin.conf .
EXPOSE 3001
CMD ["bitcoind","--conf=/bitcoin/bitcoin.conf","--datadir=/bitcoin","-printtoconsole"]
