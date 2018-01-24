# LinuxKernelBuild

Script to install the Linux Kernel from source on Debian-based distributions, for all architectures.

### Usage

It should work with any version of Linux.

For instance, to install the X.x.x version:

```
wget https://raw.githubusercontent.com/Angristan/LinuxKernelBuild/master/kernel_build.sh
chmod +x kernel_build.sh
./kernel_build.sh X.x.x
```

Reboot!

The script will compile the kernel intro `.deb` files in `/opt/linux`, and install them. 

You can uninstall the cutom kernel via APT.
