#!/bin/sh

make -C arm-elf-src/build/binutils-2.22 do-distclean
make -C arm-elf-src/build/gcc-2.95.1 do-distclean
make -C arm-elf-src/build/newlib-1.13.0 do-distclean