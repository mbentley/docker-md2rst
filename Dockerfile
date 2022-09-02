# rebased/repackaged base image that only updates existing packages
FROM mbentley/ubuntu:20.04
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

#ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update &&\
  apt-get install -y gosu pandoc &&\
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY md2rst.sh /usr/local/bin/md2rst.sh

ENTRYPOINT ["/entrypoint.sh"]
