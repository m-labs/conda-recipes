set BUILD_TYPE=Release
set CMAKE_GENERATOR=Visual Studio 15 2017 Win64

mkdir build
cd build
cmake "%SRC_DIR%" -G "%CMAKE_GENERATOR%" ^
  -DCMAKE_BUILD_TYPE="%BUILD_TYPE%" ^
  -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
  -DLLVM_BUILD_LLVM_DYLIB=ON ^
  -DLLVM_TARGETS_TO_BUILD=X86;ARM ^
  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=OR1K ^
  -DLLVM_ENABLE_ASSERTIONS=OFF ^
  -DLLVM_INSTALL_UTILS=ON ^
  -DLLVM_INCLUDE_TESTS=OFF ^
  -DLLVM_INCLUDE_DOCS=OFF ^
  -DLLVM_INCLUDE_EXAMPLES=OFF
if errorlevel 1 exit 1
cmake --build . --config "%BUILD_TYPE%"
if errorlevel 1 exit 1
cmake --build . --config "%BUILD_TYPE%" --target install
if errorlevel 1 exit 1
