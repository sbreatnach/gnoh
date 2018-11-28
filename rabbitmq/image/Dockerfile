FROM rabbitmq:3.7.8-alpine
MAINTAINER Shane Breatnach <shane.breatnach@gmail.com>

ADD definitions.json rabbitmq.config /etc/rabbitmq/
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config /etc/rabbitmq/definitions.json
