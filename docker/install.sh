#!/bin/sh -Eeu

# Instructions from http://www.cl.cam.ac.uk/users/mr/bcplman.pdf Ch12
# Had to also
#  o) install open-gl
#  o) tweak tar; add umask; add --no-same-permissions

# Install open-gl
# Install add-apt-repository
apt-get install --yes software-properties-common
# Use it to get new package source
add-apt-repository universe
apt update
# Install it
apt-get install --yes mesa-utils freeglut3-dev

# Instructions from bcplman.pdf Ch12
apt-get install --yes wget
mkdir /distribution
cd /distribution
wget http://www.cl.cam.ac.uk/~mr10/BCPL/bcpl.tgz
umask 022
tar zxvf bcpl.tgz --no-same-permissions
cd BCPL/cintcode
. os/linux/setbcplenv
make clean
make sys

# Remove unneeded files
rm /distribution/bcpl.tgz
apt-get remove --yes wget
