#!/bin/bash

mkdir build
cd build
if [ $(uname -m) = "i686" ]; then
  COMPILER32="-DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32"
fi
cmake .. $COMPILER32 -DCMAKE_INSTALL_PREFIX=$PREFIX -DOPENSSL_ROOT_DIR=$PREFIX -DBUILD_SHARED_LIBS=ON -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DCMAKE_PREFIX_PATH=$PREFIX
if errorlevel 1 exit 1
cmake --build . --config Release
if errorlevel 1 exit 1
cmake --build . --config Release --target install
if errorlevel 1 exit 1
