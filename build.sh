#!/bin/bash

sudo apt-get install -y build-essential autotools-dev autoconf automake libtool pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev nvidia-cuda-toolkit

# Simple script to create the Makefile and build

# export PATH="$PATH:/usr/local/cuda/bin/"

make distclean || echo clean

rm -f Makefile.in
rm -f config.status
./autogen.sh || echo done

# CFLAGS="-O2" ./configure
./configure.sh

make -j $(nproc)
