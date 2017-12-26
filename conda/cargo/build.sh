#!/bin/sh -ex

cargo build --release
mkdir -p $PREFIX/usr/bin
cp target/release/cargo $PREFIX/usr/bin/
