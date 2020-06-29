FROM openjdk:11.0.7-jre-slim
MAINTAINER HTC ReCAP Support "recap-support@htcindia.com"

RUN apt-get update
RUN apt-get -qq -y install curl tar

#Install Solr
RUN curl http://archive.apache.org/dist/lucene/solr/8.5.1/solr-8.5.1.tgz | tar -C /opt/ --extract --gzip
