#!/bin/sh -Eeu

# install add-apt-repository
apt-get install --yes software-properties-common
# use it to get new package source
add-apt-repository universe
apt update
# now install open-gl
apt-get install --yes mesa-utils freeglut3-dev

apt-get install --yes wget

mkdir /distribution
cd /distribution
wget http://www.cl.cam.ac.uk/~mr10/BCPL/bcpl.tgz
tar xvf bcpl.tgz
cd BCPL/cintcode
. os/linux/setbcplenv
make clean
make sys
rm /distribution/bcpl.tgz

apt-get remove --yes wget
