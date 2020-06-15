FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan@vibrato.com.au>"
LABEL Description="Azure-CLI in a minimal container"

ARG AZ_CLI_VERSION=2.7.0
RUN apk add --no-cache python3 py-pip \
 && apk add --no-cache --virtual .build-deps gcc openssl libc-dev libffi-dev libxml2-dev python3-dev libxslt-dev linux-headers openssl-dev build-base \
 && python3 -m pip install wheel --upgrade pip \
 && python3 -m pip install azure-cli==$AZ_CLI_VERSION \
 && apk del .build-deps \
 && rm -rf /root/.cache

ENV PAGER=more
WORKDIR /work
