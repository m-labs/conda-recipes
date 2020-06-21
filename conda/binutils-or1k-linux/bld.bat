set MSYS=C:\MSYS64
set TRIPLE=x86_64-pc-mingw64
set PATH=%MSYS%\usr\bin;%MSYS%\mingw64\bin;%PATH%

mkdir build
cd build
set CFLAGS=-I%PREFIX:\=/%/Library/include/
set LDFLAGS=-L%PREFIX:\=/%/Library/lib/
sh ../configure --build=%TRIPLE% ^
  --prefix="%PREFIX:\=/%/Library" ^
  --target=or1k-linux
if errorlevel 1 exit 1

make
if errorlevel 1 exit 1

make install
if errorlevel 1 exit 1

rem this is a copy of prefixed executables
rmdir /S /Q %PREFIX%\Library\or1k-linux
