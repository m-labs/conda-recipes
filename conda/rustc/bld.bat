mkdir build
cd build
python ../src/bootstrap/configure.py ^
  --disable-manage-submodules ^
  --prefix=%LIBRARY_PREFIX% ^
  --llvm-root=%LIBRARY_PREFIX% ^
  --enable-llvm-link-shared ^
  --disable-docs ^
  --enable-extended
if errorlevel 1 exit 1
python ../x.py build
if errorlevel 1 exit 1
python ../x.py install
if errorlevel 1 exit 1
