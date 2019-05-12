@echo on
mkdir build
if errorlevel 1 exit /B 1
cd build
if errorlevel 1 exit /B 1

set QWT_POLAR_INSTALL_PREFIX=%LIBRARY_PREFIX%
set QT_POLAR_INSTALL_PREFIX=%LIBRARY_PREFIX%

qmake ..\qwtpolar.pro
if errorlevel 1 exit /B 1

nmake
if errorlevel 1 exit /B 1
nmake check
if errorlevel 1 exit /B 1
nmake install
if errorlevel 1 exit /B 1
:: dll gets copied to the wrong place
move %LIBRARY_LIB%\qwtpolar.dll %LIBRARY_BIN%\qwtpolar_conda.dll
if errorlevel 1 exit /B 1

:: No test suite, but we can build the "examples/"
echo "Building examples to test library install"
mkdir -p examples
if errorlevel 1 exit /B 1
cd examples/
if errorlevel 1 exit /B 1

qmake ..\..\examples\examples.pro
if errorlevel 1 exit /B 1
nmake
if errorlevel 1 exit /B 1
nmake check
if errorlevel 1 exit /B 1

