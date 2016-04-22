#!/bin/bash

LINUX_VER=4.5.2

# Dependencies
apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc liblz4-tool kernel-package gcc-4.9-plugin-dev ca-certificates wget

# Source
cd /opt
mkdir linux
cd linux
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${LINUX_VER}.tar.xz
tar xvf linux-${LINUX_VER}.tar.xz
cd linux-${LINUX_VER}

# Config
wget https://raw.githubusercontent.com/Angristan/LinuxKernelBuild/master/config -O .config

# Compilation
make-kpkg clean
make-kpkg --initrd --revision=$(date +%F) kernel_image kernel_headers -j $(nproc)

# Installation
cd ..
dpkg -i linux-image-${LINUX_VER}_$(date +%F)_amd64.deb
dpkg -i linux-headers-${LINUX_VER}_$(date +%F)_amd64.deb
