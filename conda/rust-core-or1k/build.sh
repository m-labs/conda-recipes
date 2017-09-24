#!/bin/sh -ex

libs="libcore libstd_unicode liballoc liblibc_mini libunwind"
destdir="${PREFIX}/lib/rustlib/or1k-unknown-none/lib/"
rustc="rustc --out-dir ${destdir} --target or1k-unknown-none -g"
rustc="${rustc} -C target-feature=+mul,+div,+ffl1,+cmov,+addc -C opt-level=s"

mkdir -p ${destdir}
for lib in ${libs}; do
  ${rustc} src/${lib}/lib.rs
done
${rustc} -Cpanic=abort  src/libpanic_abort/lib.rs
${rustc} -Cpanic=unwind src/libpanic_unwind/lib.rs --cfg llvm_libunwind
