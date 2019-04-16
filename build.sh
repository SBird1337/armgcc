#!/bin/sh

current_dir=$(pwd)

##build binutils
rm -rf arm-elf/*
mkdir -p arm-elf/src arm-elf/build
mkdir -p arm-elf-src/build arm-elf-src/build/binutils-2.22
cd arm-elf-src/build/binutils-2.22
../../src/binutils-2.22/configure --target=arm-elf --prefix=$current_dir/arm-elf --disable-werror --with-cpu=arm7tdmi --with-no-thumb-interwork --host=i686-pc-linux --build=i686-pc-linux
make MAKEINFO=true all
make MAKEINFO=true install
export PATH="$PATH:$current_dir/arm-elf/bin"
##build arm gcc
cd .. && mkdir -p gcc-2.95.1 && cd gcc-2.95.1
../../src/gcc-2.95.1/configure --target=arm-elf --prefix=$current_dir/arm-elf --disable-werror --with-cpu=arm7tdmi --with-no-thumb-interwork --disable-multilib --enable-languages="c" --with-newlib --with-headers=../../src/newlib-1.11.0/newlib/libc/include --host=i686-pc-linux --build=i686-pc-linux
make MAKEINFO=true all-gcc
make MAKEINFO=true install-gcc
cd .. && mkdir -p newlib-1.11.0 && cd newlib-1.11.0
../../src/newlib-1.11.0/configure --target=arm-elf --prefix=$current_dir/arm-elf --disable-werror --with-no-thumb-interwork --with-cpu=arm7tdmi --disable-newlib-supplied-syscalls --disable-multilib --host=i686-pc-linux --build=i686-pc-linux
make MAKEINFO=true all
make MAKEINFO=true install
cd ../gcc-2.95.1
make MAKEINFO=true all
make MAKEINFO=true install