# docker-gemstash

Docker image for [gemstash](https://github.com/bundler/gemstash).

## Pull gemstash image

```shell
docker pull  minimum2scp/gemstash:latest
```

## Build gemstash image

```shell
docker build -t minimum2scp/gemstash:dev .
```

## Run gemstash container

Run container:

```
docker run --name gemstash minimum2scp/gemstash:latest
```

And use with bundler:

```shell
gemstash_uri=http://$(docker inspect gemstash | jq -r '.[].NetworkSettings.IPAddress'):9292
bundle config --global mirror.https://rubygems.org ${gemstash_uri}
```

