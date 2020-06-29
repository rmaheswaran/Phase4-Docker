FROM openjdk:11.0.7-jre-slim
MAINTAINER HTC ReCAP Support "recap-support@htcindia.com"

ENV ACTIVEMQ_VERSION 5.15.12
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION
RUN apt-get update
RUN apt-get -qq -y install curl tar
RUN cd /opt && \
curl -sLO https://archive.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/${ACTIVEMQ}-bin.tar.gz && \
tar -xvzf ${ACTIVEMQ}-bin.tar.gz

RUN mv /opt/${ACTIVEMQ} /opt/activemq

WORKDIR /opt/activemq/

