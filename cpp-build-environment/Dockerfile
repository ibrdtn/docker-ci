FROM ubuntu:latest
MAINTAINER Johannes Morgenroth <jm@m-network.de>

# Add Tini
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# install common dependencies
RUN apt-get update && apt-get install -y sudo build-essential devscripts automake autoconf pkg-config libtool debhelper cdbs git subversion wget curl gawk libncurses5-dev

# install library packages
RUN apt-get install -y libssl-dev libz-dev libsqlite3-dev libcurl4-openssl-dev libdaemon-dev libcppunit-dev libnl-3-dev libnl-cli-3-dev libnl-genl-3-dev libnl-nf-3-dev libnl-route-3-dev libarchive-dev bash-completion

# Add the jenkins user to sudoers
RUN echo "jenkins  ALL=NOPASSWD: ALL" >> etc/sudoers

# finally clean the container
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get clean -y && \
    apt-get autoclean -y && \
    apt-get autoremove -y && \
    rm -rf /usr/share/locale/* && \
    rm -rf /var/cache/debconf/*-old && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/*
