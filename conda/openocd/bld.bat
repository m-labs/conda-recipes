REM Configure step
if "%ARCH%"=="32" (
set TOOLPREF=mingw-w64-i686-
set TRIPLE=x86_64-pc-msys
) else (
set TOOLPREF=mingw-w64-x86_64-
set TRIPLE=i686-pc-msys
)
set PATH=%MSYS%\usr\bin;%MSYS%\mingw%ARCH%\bin;%PATH%

pacman -S --noconfirm %TOOLPREF%gcc %TOOLPREF%binutils make autoconf automake libtool pkg-config

sh ./bootstrap
if errorlevel 1 exit 1

mkdir build
cd build
set LIBUSB1_CFLAGS=-I%PREFIX:\=/%/Library/include/libusb-1.0 ^
  -DHAVE_LIBUSB_ERROR_NAME=1 -DHAVE_LIBUSB_GET_PORT_NUMBERS=1
set LIBUSB1_LIBS=-L%PREFIX:\=/%/Library/lib -lusb-1.0
sh ../configure --build=%TRIPLE% ^
  --prefix="%PREFIX:\=/%/Library" --bindir="%PREFIX:\=/%/Scripts" ^
  --enable-ftdi --disable-internal-libjaylink --disable-jlink
if errorlevel 1 exit 1

make
if errorlevel 1 exit 1

make install
if errorlevel 1 exit 1

rem conda has trouble with these
del %PREFIX%\Library\share\openocd\scripts\target\?1879x?1?.cfg
del %PREFIX%\Library\share\openocd\scripts\target\1986??1?.cfg
