FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install -y nodejs npm git
RUN npm install -g http-server
RUN cd /opt && git clone https://github.com/jnordberg/selfsteem
ADD . /opt/selfsteem
RUN cd /opt/selfsteem/ \
    && npm install \
    && npm run build
CMD cd /opt/selfsteem/build \
    && service cron start \
    && http-server & tail -f /var/log/*
