#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX --sysconfdir=$PREFIX/etc \
  --llvm-root=$(dirname $(dirname $(which llvm-config))) \
  --disable-docs \
  --enable-extended
make install
