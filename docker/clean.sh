#!/bin/sh
sudo /usr/bin/supervisord
sleep 3
docker system prune -f

