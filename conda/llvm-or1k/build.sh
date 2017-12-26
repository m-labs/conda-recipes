#!/bin/bash

cd tools
git clone https://github.com/m-labs/clang-or1k clang --depth 1 --branch master
cd ..
mkdir build
cd build
if [ $(uname -m) = "i686" ]; then
  COMPILER32="-DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32"
fi
cmake .. $COMPILER32 -DCMAKE_INSTALL_PREFIX=$PREFIX -DLLVM_TARGETS_TO_BUILD="OR1K;X86" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=OFF -DCLANG_ENABLE_ARCMT=OFF -DLLVM_INSTALL_UTILS=ON
make -j2
make install
