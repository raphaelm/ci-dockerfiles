FROM debian:buster

# Original copyright by Andrew Munsell
# https://github.com/andrewmunsell/gitlab-ci-runner/commit/3c6295fd461d82d3f9a9b6b7fa69a9def5621759

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y locales iptables ca-certificates python3-distutils python3-pip \
	apt-transport-https supervisor sudo python3 curl software-properties-common gnupg2 \
	--no-install-recommends
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" && \
	apt-get update -y && apt-get install -y docker-ce docker-ce-cli containerd.io ansible

RUN locale-gen && update-locale LANG=C.UTF-8
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN pip3 install setuptools wheel && pip3 install -U virtualenv docker-compose

ADD wrapdocker /usr/local/bin/wrapdocker
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD clean.sh /usr/local/bin/clean.sh
ADD supervisord.conf /etc/supervisor/conf.d/wrapdocker.conf

RUN chmod +x /usr/local/bin/wrapdocker /usr/local/bin/entrypoint.sh /usr/local/bin/clean.sh && \
	adduser --disabled-password --gecos '' --uid 1600 ciuser && \
	adduser ciuser docker && \
	echo '\nciuser ALL = (ALL) NOPASSWD:/usr/bin/supervisord' >> /etc/sudoers && \
	mkdir /builds && chown ciuser /builds

USER ciuser

ENTRYPOINT /usr/local/bin/entrypoint.sh
