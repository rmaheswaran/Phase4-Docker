FROM ubuntu:16.04
MAINTAINER HTC Recap Support "recap-support@htcindia.com"

ENV TERM=xterm

#Set Locale
RUN apt-get clean && apt-get update && apt-get install -y locales

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#Set EST Timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#Set Terminal
ENV TERM=xterm


### Basic Configuration
RUN apt-get -q update --fix-missing
RUN apt-get install -q -y software-properties-common wget curl

RUN apt-get install -qq -y git vim zip

#Install jdk1.11.x

FROM openjdk:11.0.7-jre-slim



#RUN wget \
 # --no-cookies \
   # --no-check-certificate \
  #  --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  # -qO- \
  #  "http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz" | tar -zx -C /opt/
  # "https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz" | tar -zx -C /opt/
#RUN  add-apt-repository ppa:openjdk-r/ppa
#RUN  apt-get update
#RUN  apt-get install openjdk-11-jdk



#ENV JAVA_HOME /opt/jdk1.8.0_51
#ENV JAVA_HOME /opt/jdk-11
#ENV PATH $JAVA_HOME/bin:$PATH

RUN echo ${JAVA_HOME}

#Install Gradle
ENV GRADLE_VERSION 6.3

RUN apt-get update && apt-get install -y \
curl
RUN apt-get install zip unzip
RUN apt-get update && apt-get install -y git
RUN apt-get update && apt-get install -y procps

CMD /bin/sh


RUN mkdir /opt/gradle
RUN cd /opt/gradle && \
curl -sLO https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip && \
unzip gradle-${GRADLE_VERSION}-all.zip


ENV GRADLE_HOME /opt/gradle/gradle-6.3
ENV PATH $PATH:$GRADLE_HOME/bin
