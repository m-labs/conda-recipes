set TOOLPREF=mingw-w64-i686-
set TRIPLE=x86_64-pc-mingw32
set PATH=%MSYS%\usr\bin;%MSYS%\mingw%ARCH%\bin;%PATH%

pacman -S --noconfirm %TOOLPREF%gcc %TOOLPREF%binutils make autoconf automake libtool pkg-config
if errorlevel 1 exit 1

rem upstream packaging bug https://sourceware.org/ml/crossgcc/2008-05/msg00071.html
touch bfd/doc/bfd.info

mkdir build
cd build
sh ../configure --build=%TRIPLE% ^
  --prefix="%PREFIX:\=/%/Library" ^
  --bindir="%PREFIX:\=/%/Scripts" ^
  --target=or1k-linux
if errorlevel 1 exit 1

make
if errorlevel 1 exit 1

make install
if errorlevel 1 exit 1
