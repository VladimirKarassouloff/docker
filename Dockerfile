FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive
ENV TOMCAT_HOME /opt/
RUN echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get -y update && \
    apt-get install -yq oracle-java8-installer oracle-java8-set-default && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    wget http://wwwftp.ciril.fr/pub/apache/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz && \
    tar -zxvf apache-tomcat-8.0.43.tar.gz  && \
    

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle