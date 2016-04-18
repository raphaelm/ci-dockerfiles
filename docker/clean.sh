#!/bin/sh
docker rm --volumes $(docker ps -q -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)

