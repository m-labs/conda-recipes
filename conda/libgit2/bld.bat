mkdir build
cd build
REM Configure step
if "%ARCH%"=="32" (
set CMAKE_GENERATOR=Visual Studio 14 2015
) else (
set CMAKE_GENERATOR=Visual Studio 14 2015 Win64
)
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_INSTALL_PREFIX="%PREFIX%\Library" -DSTDCALL=OFF -DSTATIC_CRT=OFF -DCMAKE_PREFIX_PATH="%PREFIX%\Library" "%SRC_DIR%"
if errorlevel 1 exit 1
cmake --build . --config Release
if errorlevel 1 exit 1
cmake --build . --config Release --target install
if errorlevel 1 exit 1
