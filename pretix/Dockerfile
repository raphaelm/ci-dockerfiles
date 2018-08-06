FROM python:3.6

MAINTAINER Raphael Michel
USER root

RUN apt-get update && apt-get install -y wget git \
	libxml2-dev libxslt1-dev python-dev locales libffi-dev \
	build-essential python3-dev zlib1g-dev libssl-dev npm gettext git \
	libpq-dev default-libmysqlclient-dev libmemcached-dev curl libfreetype6 \
	libfontconfig libfreetype6-dev libjpeg-dev bzip2 libcups2-dev \
	enchant myspell-de-de aspell-en \
	--no-install-recommends

WORKDIR /
RUN npm install -g less@2.5.0 cssmin
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN ln -s /node_modules/.bin/lessc /usr/bin/lessc
RUN ln -s /node_modules/.bin/cssmin /usr/bin/cssmin

RUN locale-gen
RUN update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

# We want a current pip
ADD get-pip.py /tmp/get-pip.py
RUN python3 /tmp/get-pip.py
RUN pip install virtualenv 

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
