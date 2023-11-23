#!/usr/bin/env bash

# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

readonly CURRENT_PATH=$(dirname "$(realpath "$0")")
readonly ROOT=$(realpath "${CURRENT_PATH}/..")

# Change directory to the project root
cd "${ROOT}" || exit

# Remove existing build directory
rm -rf product-mini/platforms/linux/build

# Create the build directory
mkdir -p product-mini/platforms/linux/build

# Change directory to the build directory
cd product-mini/platforms/linux/build || exit

# Run CMake
cmake ..

# Run Make
make

# Copy the binary to build_out directory
echo 'Copying the binary ...'
mkdir -p "${ROOT}/build_out"
cp iwasm "${ROOT}/build_out/iwasm"
