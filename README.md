# Docker for unmark

Simple docker image for unmark - [[unmark](https://github.com/cdevroe/unmark)] https://github.com/cdevroe/unmark

## Fast example usage:

### Run the database:
```shell
- docker run -p 3306:3306 -e MYSQL_DATABASE=unmark -e MYSQL_USER=`<user>` -e MYSQL_PASSWORD=`<password>` -v /my/own/datadir:/var/lib/mysql -d mariadb:latest
```

### Run the app:
```shell
- docker run -e DB_SERVER=`<ip>` -e DB_USER=`<user>` -e DB_PASS=`<password>` -p80:80 --name unmark elgranloky/unmark
```

## Parameters
|Variable|Description|
|:-|:-|
|`-e DB_SERVER=<ip>`|ip or dns name from the database server
|`-e DB_USER=<user>`|Username access database
|`-e DB_PASS=<password>`| Password for the username

## Extra parameters
The base image is [webdevops/php-nginx](https://hub.docker.com/r/webdevops/php-nginx) https://hub.docker.com/r/webdevops/php-nginx and you can use all the enviroment parameters as you can see in the [docs](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-nginx.html) https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-nginx.html 

Issues or comments are welcome :P