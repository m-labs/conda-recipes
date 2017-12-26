#!/bin/bash

cd tools
git clone https://github.com/m-labs/clang-or1k clang --depth 1 --branch artiq-4.0
cd ..
mkdir build
cd build
if [ $(uname -m) = "i686" ]; then
  COMPILER32="-DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32"
fi
cmake .. $COMPILER32 -DCMAKE_INSTALL_PREFIX=$PREFIX -DLLVM_TARGETS_TO_BUILD=X86 -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=OR1K -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=OFF -DLLVM_INSTALL_UTILS=ON -DCLANG_ENABLE_ARCMT=OFF -DCLANG_ENABLE_STATIC_ANALYZER=OFF
make -j2
make install
