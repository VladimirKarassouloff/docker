FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get -yq install mysql-server supervisor && \
  rm -rf /var/lib/apt/lists/*

ADD bind_0.cnf /etc/mysql/conf.d/bind_0.cnf
ADD mysql-run.sh /mysql-run.sh
ADD run.sh /run.sh
ADD supervisord-mysql.conf /etc/supervisor/conf.d/supervisord-mysql.conf
RUN chmod 755 /*.sh

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["/run.sh"]
