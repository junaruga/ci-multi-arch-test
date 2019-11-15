[![Travis Build Status](https://travis-ci.org/junaruga/ci-multi-arch-test.svg?branch=master)](https://travis-ci.org/junaruga/ci-multi-arch-test)
[![Drone CI Build Status](https://cloud.drone.io/api/badges/junaruga/ci-multi-arch-test/status.svg)](https://cloud.drone.io/junaruga/ci-multi-arch-test)
[![Shippable Build Status](https://api.shippable.com/projects/5bcc7f4a5a66a20600226e18/badge?branch=master)](https://app.shippable.com/github/junaruga/ci-multi-arch-test/runs?branchName=master)

# ci-multi-arch-test

## Travis CI

Using QEMU and containers. [1]

## Drone CI

Fast! A variety of platforms. You do not need to ask a system manager to start to use ARM 64/32 bit platforms. I recommend it!

* ExecRunner supported platforms: [2]
* DockerRunner supported platforms: [3]
* Supported configuration format: YAML (`.drone.yml`) and Starlark (`.drone.star`) [4].

## Shippalbe

Node pools available for free.

![alt text](resources/shippable_node_pools.png "Shippable node pools")

## Sister projects

* [ci-multi-arch-native-test](https://github.com/junaruga/ci-multi-arch-native-test): this project is focusing the native architecture cases with Travis `arch: foo` and `setarch` command.

## References

* [1] multiarch/qemu-user-static: https://github.com/multiarch/qemu-user-static
* [2] https://exec-runner.docs.drone.io/configuration/platform/
* [3] https://docker-runner.docs.drone.io/configuration/platform/
* [4] https://docs.drone.io/starlark/overview/
