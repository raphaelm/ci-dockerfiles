FROM debian:jessie

MAINTAINER Raphael Michel

RUN apt-get update && apt-get install -y apt-utils fakeroot dh-make debhelper && apt-get clean && rm -rf /var/lib/apt/lists/*
