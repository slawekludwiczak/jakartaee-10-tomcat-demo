# READSTACK

## Tech stack

Demo WebApp with basic Jakarta EE 10 stack.

If you want to create it step by step, you will find it in my tutorial on https://javastart.pl/kurs/technologie-webowe

Web layer: Servlets, JSP, JSTL, EL, HTML, CSS with Flexbox

Database layer: JDBC with MySQL

Application provides authentication with form mechanism.

Java 17, Maven with `war` packaging, deployed on Tomcat 10.

If you want to run the app locally, without docker, you have to provide additional env variables for database:
```
JAVA_OPTS=-Ddb_username=<dbuser> -Ddb_password=<dbpass> -Ddb_host=<dbhost> -Ddb_database=<dbname>
```

## How to run this app

```shell
docker compose up -d
```

![homepage](docs/img/readstack_home.png)

![login form](docs/img/readstack_login.png)