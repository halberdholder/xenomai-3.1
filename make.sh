#!/bin/bash

set -e

DESTDIR=$1

if [ -z $DESTDIR ]; then
	echo "Warning: destination directory not specified"
	DESTDIR=$(pwd)/build
	mkdir -p $DESTDIR
fi

./configure CFLAGS="-march=armv8-a" --host=aarch64-linux-gnu --with-core=cobalt --enable-smp

make -j${RK_JOBS} DESTDIR=$DESTDIR install
