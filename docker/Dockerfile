FROM docker:20-dind
RUN apk add --no-cache git bash supervisor ansible curl
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD clean.sh /usr/local/bin/clean.sh
ADD supervisord.conf /etc/supervisor.d/docker.ini
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/clean.sh
ENTRYPOINT /usr/local/bin/entrypoint.sh
