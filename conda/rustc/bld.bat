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

rem for some fucking insane reason without `start` x.py just hangs forever
rem I hate Windows. I hate Conda even more than I hate Windows. Fuck this shit.
start /wait python ../x.py build
if errorlevel 1 exit 1

start /wait python ../x.py install
if errorlevel 1 exit 1
