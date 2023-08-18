FROM alpine

EXPOSE 8080/tcp

RUN apk update --no-cache && \
    apk add --no-cache tinyproxy

COPY tinyproxy.conf /tinyproxy.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER tinyproxy

ENTRYPOINT [ "/entrypoint.sh" ]