#!/bin/bash

# - See also https://github.com/ICRAR/cloud-dingo/blob/master/azure/Build%20DINGO%20Base%20-%20CentOS7%20Azure.md
# - Installs to current directory


yum -y install git
yum -y install lapack-devel.x86_64 lapack.x86_64 python2-numpy xerces-c-devel hdf5-devel

git clone https://bitbucket.csiro.au/scm/askapsdp/yandasoft.git
pushd yandasoft
git checkout 961adb4

git clone https://github.com/casacore/casacore
pushd casacore
git checkout 0f7c684
pushd python
# FIXING Python/Cmake hiccup
sed -i -e 's,GREATER 11,GREATER 15,' CMakeLists.txt
popd
popd

# as root
./build_all.sh -s centos -S -c -a -r -y -j 4

popd
git clone https://github.com/ICRAR/cloud-dingo.git
cd cloud-dingo
git checkout 6c9c36e
