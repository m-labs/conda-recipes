#!/bin/bash -ex

git clone https://github.com/m-labs/clang-or1k tools/clang --depth 1 --branch artiq-6.0

mkdir build
cd build
cmake .. $COMPILER32 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DLLVM_TARGETS_TO_BUILD=X86 \
  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=OR1K \
  -DLLVM_ENABLE_ASSERTIONS=OFF \
  -DLLVM_INSTALL_UTILS=ON \
  -DLLVM_INCLUDE_TESTS=OFF \
  -DLLVM_INCLUDE_DOCS=OFF \
  -DLLVM_INCLUDE_EXAMPLES=OFF \
  -DCLANG_ENABLE_ARCMT=OFF \
  -DCLANG_ENABLE_STATIC_ANALYZER=OFF
make -j2
make install
