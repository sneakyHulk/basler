FROM ubuntu:jammy

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -y --quiet --no-install-recommends install \
       ca-certificates \
       wget \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

RUN wget --quiet https://www2.baslerweb.com/media/downloads/software/pylon_software/pylon-7.5.0.15658-linux-x86_64_debs.tar.gz -O pylon.tar.gz \
    && tar -xzf pylon.tar.gz \
    && dpkg -i pylon*.deb \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -y --quiet --no-install-recommends install \
       net-tools \
       telnet \
       iputils-ping \
       iproute2 \
       build-essential \
       cmake \
       gcc-12 \
       g++-12 \
    && apt-get -y autoremove \
    && apt-get clean autoclean \
    && rm -rf /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

ENV CC gcc-12
ENV CXX g++-12