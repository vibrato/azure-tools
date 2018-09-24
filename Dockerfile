FROM alpine:latest AS builder

RUN apk add --no-cache curl unzip
COPY fetch.sh /tmp/
WORKDIR /
RUN /tmp/fetch.sh

FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan@vibrato.com.au>"
LABEL Description="Azure-CLI plus Terraform in a minimal container"

COPY --from=builder terraform* /usr/local/bin/
ENV TF_PLUGIN_CACHE_DIR /usr/local/bin

RUN apk add --no-cache python py-pip bash make openssl-dev \
 && apk add --no-cache --virtual .build-deps gcc openssl-dev libffi-dev musl-dev python-dev \
 && pip install --upgrade pip \
 && pip install msrestazure~=0.4.11 future azure-cli \
 && apk del .build-deps

ENV PAGER=more
WORKDIR /work
