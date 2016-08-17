mkdir build
cd build
../configure --target=or1k-linux --prefix=$PREFIX
make -j2
make install
