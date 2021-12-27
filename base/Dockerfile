FROM rabbitmq:3.9.7

ENV RABBITMQ_USER='user'
ENV RABBITMQ_PASSWORD='password'
ENV RABBITMQ_PLUGINS=''

ADD rabbitmq.config /etc/rabbitmq/
ADD definitions.json /etc/rabbitmq/

CMD sed -i "s/RABBITMQ_PASSWORD/${RABBITMQ_PASSWORD}/g" /etc/rabbitmq/definitions.json; \
    sed -i "s/RABBITMQ_USER/${RABBITMQ_USER}/g" /etc/rabbitmq/definitions.json; \
    chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config /etc/rabbitmq/definitions.json; \
    for PLUGIN in $(echo "${RABBITMQ_PLUGINS}" | tr ',' ' '); do rabbitmq-plugins enable "${PLUGIN}"; done; \
    rabbitmq-server
