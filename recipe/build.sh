#!/bin/bash

BUILD_DIR=build
mkdir -p $BUILD_DIR && cd $BUILD_DIR

echo "Running CMAKE"
cmake -GNinja                           \
      -DBLA_VENDOR:STRING=OpenBLAS      \
      -DENABLE_PYTHON:BOOL=ON           \
      -DPython3_EXECUTABLE="$PYTHON"    \
      -DCMAKE_BUILD_TYPE:STRING=RELEASE \
      -DBUILD_DOCUMENTATION:BOOL=OFF    \
      -DCMAKE_INSTALL_PREFIX=$PREFIX    \
      -DCMAKE_INSTALL_LIBDIR=lib        \
      $SRC_DIR

cmake --build . --target install --config RELEASE
