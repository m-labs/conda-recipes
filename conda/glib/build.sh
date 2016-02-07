export LIBFFI_CFLAGS="-I$PREFIX/include"
export LIBFFI_LIBS="-L$PREFIX/lib -lffi"
./configure --prefix=$PREFIX
make
make install
