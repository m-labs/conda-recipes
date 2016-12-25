#!/bin/sh -ex

mkdir build
cd build
../configure \
  --prefix=$PREFIX \
  --llvm-root=$(dirname $(dirname $(which llvm-config))) \
  --disable-manage-submodules \
  --enable-rustbuild \
  --disable-llvm-static \
  --disable-docs

# The reasons we use LD_LIBRARY_PATH here is as follows:
#  * conda (rightly) discourages adding its library directory into LD_LIBRARY_PATH:
#    http://conda.pydata.org/docs/building/shared-libraries.html, and prefers rpath;
#  * rustc buildsystem will try to build a stage1 rustc with a stage0 rustc, which
#    has the relative rpath $ORIGIN/../lib, which assumes either a system LLVM or
#    an LLVM in LD_LIBRARY_PATH;
#  * we won't need LD_LIBRARY_PATH since rustc is installed into $PREFIX/bin, from
#    where its rpath will work as designed.
LD_LIBRARY_PATH=$PREFIX/lib \
  make install
