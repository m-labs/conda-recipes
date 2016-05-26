#!/bin/bash

./bootstrap
./configure --prefix="$PREFIX" \
    --enable-ftdi
make
make install

