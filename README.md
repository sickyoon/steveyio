
# yoons.io Blog

## Deployment

* docker image built and deployed through Gitlab CI / Registry
* use docker-compose to pull the image & deploy with traefik

## Production Environment

Deployed on Google Cloud VM running Container Optimized OS

### Setup

```
alias docker-compose='docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose:1.21.2'
```

## TODO

helm chart / jsonnet support for kubernetes
