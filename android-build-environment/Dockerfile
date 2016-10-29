FROM androhi/android-with-ndk:latest
MAINTAINER Johannes Morgenroth <jm@m-network.de>

# Add Tini
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# install common dependencies
RUN apt-get update && apt-get install -y sudo build-essential devscripts automake autoconf pkg-config libtool debhelper cdbs git subversion swig flex bison wget curl
RUN echo "jenkins  ALL=NOPASSWD: ALL" >> etc/sudoers

# install more android tools
ENV ANDROID_COMPONENTS platform-tools,build-tools-23.0.1,android-22
RUN echo y | android update sdk --no-ui --all --filter "${ANDROID_COMPONENTS}"

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

# install androgenizer
RUN git clone git://git.collabora.co.uk/git/android/androgenizer.git /opt/androgenizer
RUN make -C /opt/androgenizer

ENV PATH ${PATH}:/opt/androgenizer

