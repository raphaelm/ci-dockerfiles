FROM debian:jessie

MAINTAINER Raphael Michel <mail@raphaelmichel.de>
# Original copyright by Andrew Munsell
# https://github.com/andrewmunsell/gitlab-ci-runner/commit/3c6295fd461d82d3f9a9b6b7fa69a9def5621759

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y locales iptables ca-certificates lxc \
	apt-transport-https supervisor sudo --no-install-recommends
RUN echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN apt-get update -y && apt-get install -y lxc-docker

ADD wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

VOLUME /var/lib/docker

ADD supervisord.conf /etc/supervisor/conf.d/wrapdocker.conf

RUN adduser --disabled-password --gecos '' ciuser
RUN adduser ciuser docker
RUN echo '\nciuser ALL = (ALL) NOPASSWD:/usr/bin/supervisord' >> /etc/sudoers

USER ciuser

CMD sudo /usr/bin/supervisord && /bin/bash
