# docker-wordpress
Docker image from wordpress with de_DE.UTF-8 locales.


![Docker Base Image CI](https://github.com/thost96/docker-wordpress/workflows/Docker%20Base%20Image%20CI/badge.svg)
![Lint Code Base](https://github.com/thost96/docker-wordpress/workflows/Lint%20Code%20Base/badge.svg)
![Security Checks](https://github.com/thost96/docker-wordpress/workflows/Security%20Checks/badge.svg)

## Docker RUN
    docker run --restart=always -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress -v db_data:/var/lib/mysql mysql:5.7
    docker run --restart=always -p 80:80 -e WORDPRESS_DB_HOST=db:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress wordpress:latest

## Docker Compose

    version: '2'
    services:
      db:
        image: mysql:5.7
        volumes:
          - db_data:/var/lib/mysql
        restart: always
        environment:
	  - MYSQL_ROOT_PASSWORD=wordpress
	  - MYSQL_DATABASE=wordpress
	  - MYSQL_USER=wordpress
	  - MYSQL_PASSWORD=wordpress
      wordpress:
        depends_on:
	  - db
	image: wordpress:latest
	ports:
	  - "80:80"
	restart: always
	environment:
	  - WORDPRESS_DB_HOST=db:3306
	  - WORDPRESS_DB_USER=wordpress
	  - WORDPRESS_DB_PASSWORD=wordpress
	  - WORDPRESS_DB_NAME=wordpress
    volumes:
      - db_data

## Docker Stack (Swarm)

    version: '3.7'
    services:
      db:
        image: mysql:5.7
	volumes:
	  - db_data:/var/lib/mysql
	environment:
	  - MYSQL_ROOT_PASSWORD=wordpress
	  - MYSQL_DATABASE=wordpress
	  - MYSQL_USER=wordpress
	  - MYSQL_PASSWORD=wordpress
      wordpress:
        image: wordpress:latest
	ports:
	  - "80:80"
	environment:
	  - WORDPRESS_DB_HOST=db:3306
	  - WORDPRESS_DB_USER=wordpress
	  - WORDPRESS_DB_PASSWORD=wordpress
	  - WORDPRESS_DB_NAME=wordpress
    volumes:
      - db_data

## Changelog

### 1.0.1 (pending)
* (thost96) - pinned versions of locales and tzdata
* (thost96) - added Docker run, Compose and Stack templates

### 1.0.0 (26.11.2020)
* (thost96) - initial release
