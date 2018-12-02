#!/bin/sh
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE gitea;
    CREATE DATABASE keycloak;
    CREATE DATABASE redmine;
    CREATE DATABASE calendars;
    CREATE ROLE gitea LOGIN PASSWORD 'gitea';
    CREATE ROLE keycloak LOGIN PASSWORD 'keycloak';
    CREATE ROLE redmine LOGIN PASSWORD 'redmine';
    CREATE ROLE calendars LOGIN PASSWORD 'calendars';
    GRANT ALL PRIVILEGES ON DATABASE gitea TO gitea;
    GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
    GRANT ALL PRIVILEGES ON DATABASE redmine TO redmine;
    GRANT ALL PRIVILEGES ON DATABASE calendars TO calendars;

    CREATE ROLE zulip LOGIN PASSWORD 'zulip';
    ALTER ROLE zulip SET search_path TO zulip,public;
    CREATE DATABASE zulip OWNER=zulip;
    \connect zulip
    CREATE SCHEMA zulip AUTHORIZATION zulip;
    CREATE EXTENSION tsearch_extras SCHEMA zulip;
    CREATE EXTENSION pgroonga;
    GRANT USAGE ON SCHEMA pgroonga TO zulip;
EOSQL
