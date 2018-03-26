mkdir build
cd build
../configure --target=or1k-linux --prefix=$PREFIX
make
make install

# this is a copy of prefixed executables
rmdir /S /Q $PREFIX/or1k-linux
