+++
title = "Useful Docker Commands"
description = "Useful Docker Commands"
date = "2017-07-11T19:14:33-04:00"
categories = ["commands"]
tags = ["docker"]
draft = true
hide = true
+++

Collection of useful docker commands
<!--more-->

# Get terminal of running container
```
docker exec -i -t 69cdf5db39b7 /bin/sh
```

# Delete all containers
```
docker rm $(docker ps -a -q)
```

# Delete all images
```
docker rmi $(docker images -q)
```

# Delete all docker networks
```
docker network rm $(docker network ls | awk '/ / { print $1 }')
```

# Reload haproxy
```
docker kill -s HUP my-running-haproxy
```

