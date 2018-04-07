mkdir build
cd build
python ../src/bootstrap/configure.py \
  --prefix=%PREFIX%\Library \
  --llvm-root=%PREFIX%\Library \
  --llvm-link-shared \
  --disable-docs \
  --enable-extended
if errorlevel 1 exit 1
python ../x.py build
if errorlevel 1 exit 1
python ../x.py install
if errorlevel 1 exit 1
