FROM rabbitmq:3.9.7

ENV RABBITMQ_USER='user'
ENV RABBITMQ_PASSWORD='password'
ENV RABBITMQ_PLUGINS=''

RUN for PLUGIN in $(echo "${RABBITMQ_PLUGINS}" | tr ',' ' '); do rabbitmq-plugins enable "${PLUGIN}"; done

ADD rabbitmq.config /etc/rabbitmq/
ADD definitions.json /etc/rabbitmq/

RUN sed -i "s/RABBITMQ_PASSWORD/${RABBITMQ_PASSWORD}/g" /etc/rabbitmq/definitions.json
RUN sed -i "s/RABBITMQ_USER/${RABBITMQ_USER}/g" /etc/rabbitmq/definitions.json

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.config /etc/rabbitmq/definitions.json
CMD ["rabbitmq-server"]