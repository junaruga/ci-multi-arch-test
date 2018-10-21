[![Travis Build Status](https://travis-ci.org/junaruga/ci-multi-arch-test.svg?branch=master)](https://travis-ci.org/junaruga/ci-multi-arch-test)
[![Shippable Build Status](https://api.shippable.com/projects/5bcc7f4a5a66a20600226e18/badge?branch=master)](https://app.shippable.com/github/junaruga/ci-multi-arch-test/runs?branchName=master)

# ci-multi-arch-test

## Travis CI

Using QEMU and Docker container.

```
$ docker run --rm --privileged multiarch/qemu-user-static:register --reset

$ docker run --rm -t multiarch/ubuntu-debootstrap:arm64-bionic uname -a
Linux 28c784e9c7bc 4.4.0-101-generic #124~14.04.1-Ubuntu SMP Fri Nov 10 19:05:36 UTC 2017 aarch64 aarch64 aarch64 GNU/Linux

$ docker run --rm -t multiarch/ubuntu-debootstrap:armhf-bionic uname -a
Linux 4de7b4e919b0 4.4.0-101-generic #124~14.04.1-Ubuntu SMP Fri Nov 10 19:05:36 UTC 2017 armv7l armv7l armv7l GNU/Linux
```

## Shippalbe

Node pools available for free.

![alt text](resources/shippable_node_pools.png "Shippable node pools")
