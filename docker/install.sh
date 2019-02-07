#!/bin/sh
set -e

apt-get update
apt-get install --yes wget

mkdir /distribution
cd /distribution
wget http://www.cl.cam.ac.uk/~mr10/BCPL/bcpl.tgz
tar xvf bcpl.tgz
cd BCPL/cintcode
. os/linux/setbcplenv
make clean64
make sys64
rm /distribution/bcpl.tgz
