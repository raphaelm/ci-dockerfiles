FROM python:3.9-buster
MAINTAINER raphael@abiapp.net

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
 && apt-get install --no-install-recommends -y libmariadbclient-dev npm build-essential git \
 	rrdtool locales libcairo2-dev libpango1.0-dev libglib2.0-dev libxml2-dev libxslt1-dev librrd-dev \
	texlive-latex-recommended texlive-latex-extra texlive-xetex texlive-lang-german \
	libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev libssl-dev zbar-tools \
	libsqlite3-0 libsqlite3-dev libreadline-dev libncurses5-dev libgdbm-dev \
	graphicsmagick imagemagick groff-base lmodern wget file \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && npm install -g less@3.12.2 uglify-js \
 && ln -s /node_modules/.bin/lessc /usr/bin/lessc \
 && dpkg-reconfigure locales \
 && locale-gen C.UTF-8 \
 && /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

