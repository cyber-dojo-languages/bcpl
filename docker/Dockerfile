FROM  cyberdojofoundation/ubuntu-build-essential:18.04
LABEL maintainer=jon@jaggersoft.com

RUN apt-get update \
 && apt-get install --yes wget

RUN mkdir /distribution \
 && cd /distribution \
 && wget http://www.cl.cam.ac.uk/~mr10/BCPL/bcpl.tgz \
 && tar xvf bcpl.tgz \
 && cd BCPL/cintcode \
 && . os/linux/setbcplenv \
 && make clean64 \
 && make sys64 \
 && rm /distribution/bcpl.tgz

RUN export BCPLROOT=/distribution/BCPL/cintcode \
 && export PATH=$PATH:$BCPLROOT/bin

COPY setbcplenv /distribution/BCPL/cintcode/os/linux

COPY version.txt /tmp
RUN /distribution/BCPL/cintcode/bin/cintsys64 -v | grep -f /tmp/version.txt