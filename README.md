#Debian-tomcat-mysql

### Running

Simple:

```shell
docker run -d --name="tomcat-mysql-run" -e MYSQL_PASSWORD=password vkarassouloff/mysql
```

Exposed:

```shell
docker run -d -e MYSQL_PASSWORD=root -p 3306:3306 -p 8080:8080 vkarassouloff/mysql
```
