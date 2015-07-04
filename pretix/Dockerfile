FROM selenium/standalone-chrome:2.45.0

MAINTAINER Raphael Michel
USER root

RUN apt-get update && apt-get install -y wget python3 git python3-pip \
	libxml2-dev libxslt1-dev python-dev python-virtualenv locales libffi-dev \
	build-essential python3-dev zlib1g-dev libssl-dev npm gettext git \
	libpq-dev libmysqlclient-dev libmemcached-dev curl \
	--no-install-recommends

WORKDIR /
RUN npm install -g less@2.5.0
RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN ln -s /node_modules/.bin/lessc /usr/bin/lessc

RUN dpkg-reconfigure locales && \
	locale-gen C.UTF-8 && \
	/usr/sbin/update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
