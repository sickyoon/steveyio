
# yoons.io blog

## Deployment Flow

* Docker image built and deployed through Gitlab CI to Gitlab registry
* Use docker-compose to pull the image & deploy with traefik

## Production

Deployed on Google Cloud VM running Container Optimized OS.

### set up docker-compose alias

container optimized OS mounts path read-only.

```
alias docker-compose='docker run --rm \
     -v /var/run/docker.sock:/var/run/docker.sock \
     -v "$PWD:$PWD" \
     -w="$PWD" \
     docker/compose:1.21.2'
```

## Future development

helm chart or jsonnet support for kubernetes

