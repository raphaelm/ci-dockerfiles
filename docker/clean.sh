#!/bin/bash
/usr/bin/supervisord
for i in {0..10};
do
	sleep 2;
	docker info && break;
done
docker system prune -f
docker ps -q -f status=exited | xargs -r docker rm --volumes
docker images -q --filter "dangling=true" | xargs -r docker rmi
docker volume ls -qf dangling=true | xargs -r docker volume rm
