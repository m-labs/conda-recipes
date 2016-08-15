#!/bin/sh -ex

libs="libcore liballoc librustc_unicode libcollections liblibc_mini \
  libunwind libpanic_unwind"
destdir="${PREFIX}/lib/rustlib/or1k-unknown-none/lib/"
rustc="rustc --out-dir ${destdir} --target or1k-unknown-none -g -O"

mkdir -p ${destdir}
for lib in ${libs}; do
  ${rustc} src/${lib}/lib.rs
done
${rustc} -Cpanic=abort src/libpanic_abort/lib.rs
