#!/bin/bash

set -ex

# Show environment
uname -a
id
gcc --version
# Build logic.
make
# Test logic.
make test
