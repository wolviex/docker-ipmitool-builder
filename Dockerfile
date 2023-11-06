FROM debian:stable-slim

MAINTAINER Zdenek Styblik <stybla@turnovfree.net>

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        autoconf \
        automake \
        autotools-dev \
        bzip2 \
        gcc \
        git \
        make \
        libssl-dev \
        libtool-bin \
        vim-tiny

VOLUME ["/build", "/ipmitool-source", "/patches"]

COPY scripts/run.sh /run.sh
COPY scripts/build-ipmitool.sh /usr/local/bin/build-ipmitool.sh

RUN chmod +x /run.sh /usr/local/bin/build-ipmitool.sh

ENTRYPOINT ["/run.sh"]
