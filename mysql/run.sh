#!/usr/bin/env bash

APP_NAME=tech1-mysql
TAG=5.7.24
MYSQL_ROOT_PASSWORD=root

docker run -d --rm --name ${APP_NAME} \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
    -p 3306:3306 \
    mysql:${TAG}
