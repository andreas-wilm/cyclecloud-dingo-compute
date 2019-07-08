#!/bin/bash

set -ex

yum install -y openmpi environment-modules

echo "module load mpi" >> ~cycleadmin/.bashrc
 
