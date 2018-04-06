#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX \
  --sysconfdir=$PREFIX/etc \
  --llvm-root=$PREFIX \
  --disable-docs \
  --enable-extended
make install
