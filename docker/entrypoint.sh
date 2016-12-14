#!/bin/bash
sudo /usr/bin/supervisord
for i in {0..10};
do
	sleep 2;
	docker version && break;
done
exec bash $*
