This repo contains a Docker composition that builds an HBase and an OpenTSDB image/container and runs a single node of each together.

## Usage

```
docker-compose up
```

where port 4242 is exposed for OpenTSDB HTTP API access.

After stopping the composition, it's best to follow-up with a `docker-compose down -v` to ensure the HBase volume is removed

## Building with a particular release of HBase or OpenTSDB:

Use `docker-compose build` with either or both, where defaults are shown:
- `--build-arg OTSDB_VERSION=2.4.0`
- `--build-arg HBASE_VERSION=2.2.4`

