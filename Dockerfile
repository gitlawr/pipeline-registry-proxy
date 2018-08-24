FROM nginx:1.14.0-alpine

RUN apk -U --no-cache add bash curl wget ca-certificates \
    && mkdir -p /opt/rke-tools/bin /etc/confd \
    && curl -sLf https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 > /usr/bin/confd \
    && chmod +x /usr/bin/confd \
    && apk del curl

COPY templates /etc/confd/templates/
COPY conf.d /etc/confd/conf.d/
COPY nginx-proxy /usr/bin/

CMD ["/bin/bash"]
