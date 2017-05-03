FROM debian
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get -yq install mysql-server && \
  rm -rf /var/lib/apt/lists/*

ADD bind_0.cnf /etc/mysql/conf.d/bind_0.cnf

ADD run.sh /init.sh
RUN chmod 755 /*.sh
ENTRYPOINT ["/init.sh"]

VOLUME /var/lib/mysql
EXPOSE 3306
CMD ["mysqld_safe"]