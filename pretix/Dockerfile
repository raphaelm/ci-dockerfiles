FROM python:3.10-buster

MAINTAINER Raphael Michel
USER root

RUN apt-get update && apt-get install -y wget git \
	libxml2-dev libxslt1-dev python-dev locales libffi-dev \
	build-essential python3-dev zlib1g-dev libssl-dev gettext git \
	libpq-dev default-libmysqlclient-dev libmemcached-dev curl libfreetype6 \
	libfontconfig libfreetype6-dev libjpeg-dev bzip2 libcups2-dev \
	enchant myspell-de-de aspell-en rsync sudo \
	--no-install-recommends

WORKDIR /

RUN curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash - && \
	apt-get install -y nodejs && \
	curl -qL https://www.npmjs.com/install.sh | sh

RUN npm install -g less@2.5.0 cssmin

RUN locale-gen
RUN update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN pip install virtualenv 

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
