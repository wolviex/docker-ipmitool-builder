FROM debian:stable-slim

MAINTAINER Joe M <joe@manifold.rocks>

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
        vim-tiny \
        curl \
        ipmitool

COPY scripts/* /usr/local/bin/

RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["/usr/local/bin/run.sh"]
