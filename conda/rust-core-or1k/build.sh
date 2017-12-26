#!/bin/sh -ex

destdir="${PREFIX}/lib/rustlib/or1k-unknown-none/lib/"
rustc="rustc --out-dir ${destdir} -L ${destdir} --target or1k-unknown-none -g"
rustc="${rustc} -C target-feature=+mul,+div,+ffl1,+cmov,+addc -C opt-level=s"
rustc="${rustc} --crate-type rlib"

${rustc} --crate-name core ../src/libcore/lib.rs
${rustc} --crate-name std_unicode ../src/libstd_unicode/lib.rs
${rustc} --crate-name alloc ../src/liballoc/lib.rs
${rustc} --crate-name libc ../src/liblibc_mini/lib.rs
${rustc} --crate-name unwind ../src/libunwind/lib.rs
${rustc} -Cpanic=abort --crate-name panic_abort ../src/libpanic_abort/lib.rs
${rustc} -Cpanic=unwind --crate-name panic_unwind ../src/libpanic_unwind/lib.rs \
  --cfg llvm_libunwind
