# Docker CI #

This repository contains Dockerfiles for building IBR-DTN for Debian and Android.

## Slave Set-up for ARM binaries ##

Each slave must have binfmt support and qemu user binaries installed.

```
apt-get install binfmt-support qemu-user-static
```

Add this line to '/etc/rc.local'.

```
echo ':arm:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x28\x00:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/bin/qemu-arm-static:' > /proc/sys/fs/binfmt_misc/register
```

