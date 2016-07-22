FROM alpine:latest

MAINTAINER Félix Sanz <me@felixsanz.com>

RUN apk add --update --no-cache gcc

RUN apk add --no-cache --virtual .build-deps \
  git autoconf make g++ && \
  mkdir -p /usr/src/ssdb && \
  git clone --depth 1 https://github.com/ideawu/ssdb.git /usr/src/ssdb && \
  make -C /usr/src/ssdb && \
  make -C /usr/src/ssdb install && \
  rm -r /usr/src/ssdb && \
  apk del .build-deps

COPY ssdb.conf /usr/local/ssdb/ssdb.conf

EXPOSE 8888

RUN mkdir /data

VOLUME /data

WORKDIR /data

ENTRYPOINT ["/usr/local/ssdb/ssdb-server", "/usr/local/ssdb/ssdb.conf"]
