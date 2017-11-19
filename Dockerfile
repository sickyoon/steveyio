FROM alpine:latest

ENV HUGO_VERSION 0.30.2
ENV HUGO_BASE_URL https://stevey.io

RUN apk add --no-cache curl

WORKDIR /tmp
RUN curl -L https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz
RUN mv hugo /usr/local/bin/hugo

# blog directory
# make sure to link volume "-v $PWD:/src"
WORKDIR /src

EXPOSE 1313
ENTRYPOINT /usr/local/bin/hugo server --baseURL=${HUGO_BASE_URL} --appendPort=false --bind=0.0.0.0
