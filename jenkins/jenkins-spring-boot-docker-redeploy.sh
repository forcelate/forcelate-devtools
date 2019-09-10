#!/usr/bin/env bash

COMPANY=forcelate
APP=spring-boot-server
TAG=latest
SPRING_BOOT_PROFILE=prod

if [ "$(docker ps -q -f name=${APP})" ]; then docker kill ${APP}; else echo "Container ${APP} is missing"; fi
if [ "$(docker ps -q -a -f name=${APP})" ]; then docker rm ${APP}; else echo "Container ${APP} is missed."; fi

docker pull ${COMPANY}/${APP}:${TAG}

docker run -d -it -p 8484:8484 \
	-v /root/app/logs:/root/app/logs \
 	-e SPRING_BOOT_PROFILE=${SPRING_BOOT_PROFILE} \
 	--restart unless-stopped \
  	--name ${APP} ${COMPANY}/${APP}:${TAG}
