FROM postgres:9.6
MAINTAINER Shane Breatnach <shane.breatnach@gmail.com>

RUN apt update && \
    apt install -y apt-transport-https wget git
# PGroonga: full text search support for non-EU languages
# plus hunspell dicts
COPY groonga.list /etc/apt/sources.list.d/
RUN wget -O /usr/share/keyrings/groonga-archive-keyring.gpg \
        https://packages.groonga.org/debian/groonga-archive-keyring.gpg && \
    apt update && \
    apt install -y postgresql-9.6-pgroonga hunspell-en-us && \
    ln -sf /var/cache/postgresql/dicts/en_us.dict \
        "/usr/share/postgresql/9.6/tsearch_data/en_us.dict" && \
    ln -sf /var/cache/postgresql/dicts/en_us.affix \
        "/usr/share/postgresql/9.6/tsearch_data/en_us.affix"
# custom Zulip extension: extra full text search functions
RUN wget --content-disposition \
  https://packagecloud.io/zulip/server/packages/debian/stretch/postgresql-9.6-tsearch-extras_0.4_amd64.deb/download.deb \
  && dpkg -i postgresql-9.6-tsearch-extras_0.4_amd64.deb
COPY zulip_english.stop /usr/share/postgresql/9.6/tsearch_data/zulip_english.stop
