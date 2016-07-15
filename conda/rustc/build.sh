#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX \
  --llvm-root=$(which llvm-config)/../..
make install
