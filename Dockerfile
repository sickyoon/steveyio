FROM alpine:latest

ENV HUGO_VERSION 0.42.2

WORKDIR /tmp

RUN apk add --no-cache curl && \
    curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz && \
    mv hugo /usr/local/bin/hugo

RUN mkdir -p /blog
COPY . /blog
WORKDIR /blog

EXPOSE 1313

ENTRYPOINT /usr/local/bin/hugo server --baseURL=${HUGO_BASE_URL} --appendPort=false --bind=0.0.0.0
