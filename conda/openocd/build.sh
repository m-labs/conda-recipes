#!/bin/bash

./bootstrap
./configure --prefix="$PREFIX" \
    --enable-ftdi
make
make install

# conda chokes on non-ascii: 1986ве1т.cfg
rm $PREFIX/share/openocd/scripts/target/1986??1?.cfg
