FROM rabbitmq:3.9.7-management

ENV RABBITMQ_USERNAME 'user'
ENV RABBITMQ_PASSWORD 'password'
ENV RABBITMQ_PID_FILE /var/lib/rabbitmq/mnesia/rabbitmq
ENV RABBITMQ_PLUGINS ''

CMD \
    ( \
        rabbitmqctl wait --timeout 60 $RABBITMQ_PID_FILE \
        && for PLUGIN in $(echo "${RABBITMQ_PLUGINS}" | tr ',' ' '); do rabbitmq-plugins enable "${PLUGIN}"; done \
        && rabbitmqctl add_user $RABBITMQ_USERNAME $RABBITMQ_PASSWORD 2>/dev/null \
        && rabbitmqctl set_user_tags $RABBITMQ_USERNAME administrator \
        && rabbitmqctl set_permissions -p / $RABBITMQ_USERNAME  ".*" ".*" ".*" \
        && echo "*** User '$RABBITMQ_USERNAME' with password '$RABBITMQ_PASSWORD' completed. ***" \
    ) & \
    rabbitmq-server $@
