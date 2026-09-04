FROM debian:trixie-slim

WORKDIR /

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    libboost-system-dev \
    libboost-thread-dev \
    libboost-program-options-dev \
    libboost-test-dev \
    libeigen3-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/allo-media/kenlm.git /opt/kenlm
RUN mkdir -p /opt/kenlm/build && cd /opt/kenlm/build \
    && cmake .. \
    && make -j $(nproc) \
    && make install
