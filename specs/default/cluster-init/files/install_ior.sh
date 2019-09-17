#!/bin/bash

PREFIX=/shared

yum -y install git automake openmpi-devel

cd /tmp
git clone  https://github.com/chaos/ior.git
cd ior/
./bootstrap
CFLAGS='-I/usr/include/openmpi-x86_64/ -L/usr/lib64/openmpi/lib/' ./configure --prefix $PREFIX
make -j 4
# as root
make install
# cleanup
cd ..
rm -rf ior


