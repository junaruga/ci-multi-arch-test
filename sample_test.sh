#!/bin/bash

set -ev

# Show environment
uname -a
id
gcc --version
# Build logic.
make
bin/arch-test
# Test logic.
