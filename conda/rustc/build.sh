#!/bin/sh -ex

export LD_LIBRARY_PATH=$PREFIX/lib

mkdir build
cd build
../configure \
  --disable-manage-submodules \
  --prefix=$PREFIX \
  --sysconfdir=$PREFIX/etc \
  --llvm-root=$PREFIX \
  --enable-llvm-link-shared \
  --disable-docs \
  --enable-extended
make install
