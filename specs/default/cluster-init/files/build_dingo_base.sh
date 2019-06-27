#!/bin/bash

# See also https://github.com/ICRAR/cloud-dingo/blob/master/azure/Build%20DINGO%20Base%20-%20CentOS7%20Azure.md


cd
yum -y install git
git clone https://bitbucket.csiro.au/scm/askapsdp/yandasoft.git
yum -y install lapack-devel.x86_64 lapack.x86_64 python2-numpy xerces-c-devel hdf5-devel
cd yandasoft
git clone https://github.com/casacore/casacore
cd casacore/python
# FIXING Python/Cmake hiccup
sed -i -e 's,GREATER 11,GREATER 15,' CMakeLists.txt
cd ~/yandasoft/
./build_all.sh -s centos -S -c -a -r -y -j 4

cd git clone https://github.com/ICRAR/cloud-dingo.git




