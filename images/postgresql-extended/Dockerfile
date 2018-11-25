FROM postgres:9.6
MAINTAINER Shane Breatnach <shane.breatnach@gmail.com>

RUN apt update && \
    apt install -y apt-transport-https wget
COPY groonga.list /etc/apt/sources.list.d/
RUN wget -O /usr/share/keyrings/groonga-archive-keyring.gpg \
        https://packages.groonga.org/debian/groonga-archive-keyring.gpg && \
    apt update && \
    apt install -y postgresql-9.6-pgroonga
RUN wget --content-disposition \
  https://packagecloud.io/zulip/server/packages/debian/stretch/postgresql-9.6-tsearch-extras_0.4_amd64.deb/download.deb \
  && dpkg -i postgresql-9.6-tsearch-extras_0.4_amd64.deb

