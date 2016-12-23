#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX \
  --llvm-root=$(dirname $(dirname $(which llvm-config))) \
  --disable-manage-submodules \
  --enable-rustbuild \
  --disable-llvm-static
make install
