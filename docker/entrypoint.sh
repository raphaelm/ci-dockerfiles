#!/bin/bash
sudo /usr/bin/supervisord
sleep 2
exec bash $*
