# docker-gemstash

## Build gemstash image

```shell
docker build -t minimum2scp/gemstash:tag .
```

## Run gemstash container

Run container:

```
docker run --name gemstash minimum2scp/gemstash:tag
```

And use with bundler:

```shell
gemstash_uri=http://$(docker inspect gemstash | jq -r '.[].NetworkSettings.IPAddress'):9292
bundle config --global mirror.https://rubygems.org ${gemstash_uri}
```

