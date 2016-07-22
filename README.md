# docker-ssdb

## Description

Dockerfile for [SSDB](https://github.com/ideawu/ssdb).

Configuration parameters modified: `work_dir`, `pidfile` and `logger:level`.

## Installation

```
docker pull felixsanz/ssdb
```

## Usage

Start the container with the following command:

```
docker run --rm -p 8888:8888 --name ssdb felixsanz/ssdb
```

SSDB is now available at port `8888`.

### Share database with host

This container saves the database files inside `/data`, so if you want to host this files inside your hosts filesystem (good for persistence/backups), start the container with the following command instead:

```
docker run --rm -v ssdb:/data -p 8888:8888 --name ssdb felixsanz/ssdb
```

**Note:** Docker volume `ssdb` must be [created previously](https://docs.docker.com/engine/reference/commandline/volume_create/).

### Custom configuration

If you want to bring your own `conf` file, add it:

```
docker run --rm -v /path/to/ssdb.conf:/usr/local/ssdb/ssdb.conf -p 8888:8888 --name ssdb felixsanz/ssdb
```

### Running `ssdb-cli`

If you want to run the CLI interface, you have to either fork this Dockerfile and install python with `RUN apk add python` command, or (easier), start the container as above and execute this command:

```
docker exec ssdb apk add python
```

You can then start the CLI interface with:

```
docker exec -it ssdb /usr/local/ssdb/ssdb-cli
```
