#!/bin/sh

DOCKER_BIN=${1:-docker.exe}

${DOCKER_BIN} build -t sbreatnach/postgresql-9.6-extended:1.0.0 postgresql/image/

${DOCKER_BIN} build -t sbreatnach/rabbitmq-3.7.8-extended:1.0.0 rabbitmq/image/
