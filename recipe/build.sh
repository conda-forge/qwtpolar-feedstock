#!/bin/bash

[[ -d build ]] || mkdir build
cd build/

export QWT_POLAR_INSTALL_PREFIX=$PREFIX
export QT_POLAR_INSTALL_PREFIX=$PREFIX

qmake ../qwtpolar.pro

make
make check
make install

# No test suite, but we can build the "examples/"
echo "Building examples to test library install"
mkdir -p examples
cd examples/

qmake ../../examples/examples.pro
make
make check
