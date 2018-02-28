set TOOLPREF=mingw-w64-i686-
set TRIPLE=x86_64-pc-mingw32
set PATH=%MSYS%\usr\bin;%MSYS%\mingw%ARCH%\bin;%PATH%

pacman -S --noconfirm %TOOLPREF%gcc %TOOLPREF%binutils make autoconf automake libtool texinfo
if errorlevel 1 exit 1

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

rem this is a copy of prefixed executables
rmdir /S /Q %PREFIX%\Library\or1k-linux

rem conda doesn't ship iconv-2.dll
copy %MSYS%\usr\bin\msys-iconv-2.dll %PREFIX%\Scripts\iconv-2.dll
