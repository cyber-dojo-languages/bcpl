#!/bin/sh -Eeu

# Instructions from http://www.cl.cam.ac.uk/users/mr/bcplman.pdf Ch12
# Had to also
#  o) install open-gl
#  o) hack-fix the untarred dir/file permissions 

# Install add-apt-repository
apt-get install --yes software-properties-common
# Use it to get new package source
add-apt-repository universe
apt update
# Install open-gl
apt-get install --yes mesa-utils freeglut3-dev

apt-get install --yes wget
mkdir /distribution
cd /distribution
wget http://www.cl.cam.ac.uk/~mr10/BCPL/bcpl.tgz
tar zxvf bcpl.tgz
cd BCPL/cintcode
. os/linux/setbcplenv
make clean
make sys

# Remove unneeded files
rm /distribution/bcpl.tgz
apt-get remove --yes wget

# Hack-fix permissions
cd /distribution
find . -type f -print0 | xargs -0 chmod 755
find . -type d -print0 | xargs -0 chmod 755
