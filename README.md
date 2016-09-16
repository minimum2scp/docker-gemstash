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

## Environment Variables

Environment variables which starts with `GEMSTASH_` will be
mapped to /etc/gemstash/config.yml by entrypoint script.

- `GEMSTASH_BASE_PATH`
- `GEMSTASH_CACHE_TYPE`
- `GEMSTASH_MEMCACHED_SERVERS`
- `GEMSTASH_DB_ADAPTER`
- `GEMSTASH_DB_URL`
- `GEMSTASH_RUBYGEMS_URL`
- `GEMSTASH_BIND`
- `GEMSTASH_PROTECTED_FETCH`
- `GEMSTASH_FETCH_TIMEOUT`

See https://github.com/bundler/gemstash/blob/master/docs/reference.md#configuration for details.


