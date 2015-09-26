FROM debian:jessie
MAINTAINER raphael@abiapp.net

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python python-pip python-dev \
	libmysqlclient-dev python-virtualenv npm build-essential git rrdtool locales \
	libcairo2-dev libpango1.0-dev libglib2.0-dev libxml2-dev libxslt1-dev librrd-dev \
	texlive-latex-recommended texlive-latex-extra texlive-xetex texlive-lang-german \
	memcached nginx graphicsmagick

RUN npm install -g less@2.5.0
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN ln -s /node_modules/.bin/lessc /usr/bin/lessc

RUN locale-gen
RUN update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install wheel

CMD ["/bin/bash"]
