#!/bin/sh
sudo /usr/bin/supervisord
sleep 3
docker system prune -f

docker ps -q -f status=exited | xargs -r docker rm --volumes
docker images -q --filter "dangling=true" | xargs -r docker rmi
docker volume ls -qf dangling=true | xargs -r docker volume rm
