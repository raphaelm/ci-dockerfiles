#!/bin/bash
sudo /usr/bin/supervisord
exec bash $*
