#!/bin/bash

cargo lipo --release
cbindgen src/lib.rs -l c > rust.h

cp ../target/universal/release/librustios.a ../../ios
cp rust.h ../../ios/