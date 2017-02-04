#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX \
  --llvm-root=$(dirname $(dirname $(which llvm-config))) \
  --disable-manage-submodules
make install VERBOSE=1
