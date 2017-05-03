#Debian-tomcat-mysql

### Running

Simple:

```shell
docker run -d --name="tomcat-mysql-run" -e MYSQL_PASSWORD=root vkarassouloff/mysql
```

Exposed:

```shell
docker run -d -e MYSQL_PASSWORD=root -p 3306:3306 vkarassouloff/mysql
```
