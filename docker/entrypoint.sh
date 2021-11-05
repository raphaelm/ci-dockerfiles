#!/bin/bash
/usr/bin/supervisord
for i in {0..10};
do
	sleep 2;
	docker info && break;
done
exec bash $*
