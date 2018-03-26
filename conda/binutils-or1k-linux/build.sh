mkdir build
cd build
../configure --target=or1k-linux --prefix=$PREFIX
make
make install

# this is a copy of prefixed executables
rm -rf $PREFIX/or1k-linux
