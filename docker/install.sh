#!/bin/sh -Eeu

apt-get install --yes libglu1-mesa libglu1-mesa-dev
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
