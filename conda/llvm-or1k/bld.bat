cd tools
git clone https://github.com/m-labs/clang-or1k clang --depth 1 --branch artiq-6.0
cd ..

mkdir build
cd build
set BUILD_CONFIG=Release
REM Configure step
set CMAKE_GENERATOR=Visual Studio 15 2017 Win64
set CMAKE_CUSTOM=-DLLVM_TARGETS_TO_BUILD=X86 ^
-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=OR1K ^
-DLLVM_INCLUDE_TESTS=OFF -DLLVM_INCLUDE_UTILS=OFF ^
-DLLVM_INCLUDE_DOCS=OFF -DLLVM_INCLUDE_EXAMPLES=OFF ^
-DLLVM_ENABLE_ASSERTIONS=OFF
cmake -G "%CMAKE_GENERATOR%" ^
-DCMAKE_BUILD_TYPE="%BUILD_CONFIG%" -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
-DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" -DLLVM_INSTALL_UTILS=ON ^
%CMAKE_CUSTOM% "%SRC_DIR%"
if errorlevel 1 exit 1
REM Build step
cmake --build . --config "%BUILD_CONFIG%"
if errorlevel 1 exit 1
REM Install step
cmake --build . --config "%BUILD_CONFIG%" --target install
if errorlevel 1 exit 1
