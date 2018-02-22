# LinuxKernelBuild

Script to install the Linux kernel from source on Debian-based distributions, for all architectures.

## Usage

It should work with any kernel version.

For instance, to install the x.y.z version:

```
wget https://raw.githubusercontent.com/Angristan/LinuxKernelBuild/master/kernel_build.sh
chmod +x kernel_build.sh
./kernel_build.sh x.y.z
```

Reboot!

The script will compile the kernel into `.deb` files in `/opt/linux` then install them.

You can uninstall the custom kernel using APT.
