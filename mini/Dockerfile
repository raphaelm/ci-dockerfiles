FROM debian:jessie

MAINTAINER Raphael Michel
USER root

RUN apt-get update && \
	apt-get install -y wget python3 git python3-pip \
	git curl build-essential --no-install-recommends && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /

RUN locale-gen && \ 
	update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

CMD ["/bin/bash"]
