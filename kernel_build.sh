#!/bin/bash

# Variables
LINUX_VER=4.5.4

# Dependencies
apt-get install -y git fakeroot build-essential kernel-package ncurses-dev xz-utils libssl-dev bc liblz4-tool paxctl

# GCC
GCC_VER=$(gcc -dumpversion | cut -c1)
if [[ $GCC_VER != "5" ]]; then
	GCC_VER=$(gcc -dumpversion | cut -c1-3)
fi
apt-get install -y gcc-${GCC_VER}-plugin-dev

cd /opt
mkdir linux
cd linux
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-${LINUX_VER}.tar.xz
tar xvf linux-${LINUX_VER}.tar.xz
cd linux-${LINUX_VER}

# Config
# wget https://raw.githubusercontent.com/Angristan/LinuxKernelBuild/master/config -O .config
#cp /boot/config-$(uname -r) .config

# Compilation
make-kpkg clean
make-kpkg --initrd --revision=$(date +%F) kernel_image kernel_headers -j $(nproc)

# Installation
cd ..
dpkg -i linux-image-${LINUX_VER}_$(date +%F)_amd64.deb
dpkg -i linux-headers-${LINUX_VER}_$(date +%F)_amd64.deb

# Load the new kernel without reboot
#apt-get install kexec-tools
#systemctl kexec
