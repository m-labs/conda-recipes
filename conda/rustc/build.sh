#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX \
  --llvm-root=$(which llvm-config)/../.. \
  --disable-manage-submodules
make install
