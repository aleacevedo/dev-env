
FROM ubuntu:20.04

RUN apt update

RUN apt install -y debian-keyring debian-archive-keyring apt-transport-https curl

RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/gpg/gpg.155B6D79CA56EA34.key' | apt-key add -

RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/cfg/setup/config.deb.txt?distro=debian&version=any-version' | tee -a /etc/apt/sources.list.d/caddy-stable.list

RUN apt update

RUN apt install -y  caddy

COPY Caddyfile /etc/caddy/Caddyfile

RUN curl -fsSL https://code-server.dev/install.sh | sh

CMD ["code-server"]
