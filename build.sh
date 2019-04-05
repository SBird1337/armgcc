#!/bin/sh

##build binutils
rm -rf /arm-elf/*
mkdir /arm-elf/src /arm-elf/build
cd arm-elf-src/build && mkdir binutils-2.22 && cd binutils-2.22
../../src/binutils-2.22/configure --target=thumb-elf --prefix=/arm-elf --disable-werror --with-cpu=arm7tdmi --with-no-thumb-interwork --host=i686-pc-linux --build=i686-pc-linux
make all
make install
export PATH="$PATH:/arm-elf/bin"
##build thumb gcc
cd .. && mkdir gcc-2.95.1 && cd gcc-2.95.1
../../src/gcc-2.95.1/configure --target=arm-elf --prefix=/arm-elf --disable-werror --with-cpu=arm7tdmi --with-no-thumb-interwork --disable-multilib --enable-languages="c" --with-newlib --with-headers=../../src/newlib-1.20.0/newlib/libc/include --host=i686-pc-linux --build=i686-pc-linux
make all-gcc
make install-gcc