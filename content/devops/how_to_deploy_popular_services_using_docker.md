+++
title = "How to deploy popular services using Docker (MongoDB, Redis, Nginx)"
description = "How to deploy popular services using Docker (MongoDB, Redis, Nginx)"
date = "2016-12-11T23:27:09+09:00"
categories = ["devops"]
tags = ["mongo", "redis", "docker"]
thumbnail = ""
+++

Docker is containerization platform that provides `containers` that provide isolated environment for a single service.
I have put together popular commands to run dockerized services instead of running them directly on host machine.
<!--more-->

## MongoDB

Setting up MongoDB using docker to behave as your native installation, we just have to ensure corresponding volumes and ports are mapped correctly to host.

```bash
docker pull mongo
docker run --name mongo -p 27017:27017 -v /data/db:/data/db -d mongo:latest
```

## Redis

TODO

## Nginx

TODO

