#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX
make
make install
