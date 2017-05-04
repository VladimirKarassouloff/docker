FROM vkarassouloff/java

ENV DEBIAN_FRONTEND noninteractive
ENV TOMCAT_HOME /opt/apache-tomcat-8.0.43
RUN echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list && \
    echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 && \
    apt-get -y update && \
    apt-get install -yq oracle-java8-installer oracle-java8-set-default && \
    cd /tmp && \
    wget http://wwwftp.ciril.fr/pub/apache/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz && \
    tar xzvf apache-tomcat-8.0.43.tar.gz -C /opt/ && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer && \
    rm -rf /tmp

ADD run.sh /run.sh
ADD settings.xml $TOMCAT_HOME/conf/settings.xml
ADD tomcat-users.xml $TOMCAT_HOME/conf/tomcat-users.xml

RUN chmod 755 /run.sh

EXPOSE 8080 8000


ENTRYPOINT ["/run.sh"]


