# Docker build instructions:
#
# docker build <Dockerfile location>
# docker run -it <container ID>
#
# Container ID can be found in the docker build output:
#
# Ex: Successfully built ca544a43eaf7
#
# Note: the build process will depend on available hardware/etc,
# but generally runs about 10 minutes to download, compile, and install
# the required software and dependencies

FROM ubuntu:20.10
LABEL maintainer="Michael Matirko <mmatirko@cisco.com>"

# Workaround for headless installation hang during Docker build
ARG DEBIAN_FRONTEND=noninteractive

# Update the image's pre-installed packages
RUN \
apt-get update && \
apt-get dist-upgrade -y && \
# Install the Snort build dependencies
apt-get install -y \
    autoconf \
    build-essential \
    cmake \
    cpputest \
    flex \
    libasan5 \
    libdumbnet-dev \
    libhwloc-dev \
    libhyperscan-dev \
    libluajit-5.1-dev \
    liblzma-dev \
    libmnl-dev \
    libpcap-dev \
    libpcre3-dev \
    libssl-dev \
    libunwind-dev \
    pkg-config \
    uuid-dev \
    zlib1g-dev \
# Install the Demo build/runtime requirements
    bats \
    python3 \
    sudo \
    wget \
    unzip \
    google-perftools \
    libgoogle-perftools-dev \
    iproute2 \
    && \
    apt-get remove -y libhwloc-plugins \
    && \
    apt-get clean

# Install some packages to make life easier, can be removed if desired
RUN apt-get install -y \
    git \
    vim

# Download and install Libdaq
RUN mkdir /root/snort-sources && \
    cd /root/snort-sources && \
    wget https://github.com/snort3/libdaq/archive/refs/heads/master.zip -O libdaq-master.zip && \
    unzip libdaq-master.zip && \
    cd libdaq-master && \
    ./bootstrap && \
    ./configure && \
    make -j$(nproc) && \
    make -j$(nproc) install && \
    ldconfig

# Download and compile the latest Snort3
RUN cd /root/snort-sources && \
    wget https://github.com/snort3/snort3/archive/refs/heads/master.zip -O snort3-master.zip && \
    unzip snort3-master.zip && \
    cd snort3-master && \
    export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig && \
    ./configure_cmake.sh --prefix=/usr/local --enable-unit-tests && \
    cd ./build && \
    make -j$(nproc) && \
    make -j$(nproc) install

# Download and compile the latest Snort3_extra
RUN cd /root/snort-sources && \
    wget https://github.com/snort3/snort3_extra/archive/refs/heads/master.zip -O snort3_extra-master.zip && \
    unzip snort3_extra-master.zip && \
    cd snort3_extra-master && \
    export PKG_CONFIG_PATH=/root/snort-sources/snort3-master/install/lib/pkgconfig && \
    ./configure_cmake.sh && \
    cd build && \
    make -j$(nproc) && \
    make -j$(nproc) install

#Verify Snort runs correctly
RUN /usr/local/bin/snort -V

RUN cd /root/snort-sources &&\
    wget https://github.com/snort3/snort3_demo/archive/refs/heads/master.zip -O snort3_demo-master.zip && \
    unzip snort3_demo-master.zip && \
    export SNORT_PLUGINS=/usr/local/snort/lib/ && \
    cd ./snort3_demo-master/

# Some cleanup for install paths to make demo work
RUN ln -sfn /usr/local/snort/lib/snort_extra/ /usr/local/lib/snort_extra

# Run CPPUtests
RUN /usr/local/bin/snort --catch-test all

# Run the snort3_demo examples
RUN cd /root/snort-sources/snort3_demo-master && ./run_test.sh /usr/local
