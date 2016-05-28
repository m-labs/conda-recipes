mkdir build
cd build
REM Configure step
if "%ARCH%"=="32" (
set CMAKE_GENERATOR=Visual Studio 14 2015
) else (
set CMAKE_GENERATOR=Visual Studio 14 2015 Win64
)
set CMAKE_GENERATOR_TOOLSET=v140
cmake -G "%CMAKE_GENERATOR%" -T %CMAKE_GENERATOR_TOOLSET% -DCMAKE_INSTALL_PREFIX="%PREFIX%\Library" -DCMAKE_PREFIX_PATH="%PREFIX%\Library" "%SRC_DIR%"
if errorlevel 1 exit 1
REM Build step
cmake --build .
if errorlevel 1 exit 1
REM Install step
cmake --build . --target install
if errorlevel 1 exit 1
