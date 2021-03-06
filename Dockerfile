FROM ubuntu:18.04
MAINTAINER Matt Bentley <mbentley@mbentley.net>

#ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update &&\
  apt-get install -y gosu pandoc &&\
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY md2rst.sh /usr/local/bin/md2rst.sh

ENTRYPOINT ["/entrypoint.sh"]
