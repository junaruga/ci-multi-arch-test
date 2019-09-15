#!/bin/bash
set -xeo pipefail

BASE_IMAGE=${BASE_IMAGE:-registry.access.redhat.com/ubi8}
INSPECTED_ARCH=${INSPECTED_ARCH:-arm64}

if ! command -v skopeo > /dev/null; then
    echo "skopeo is required." 1>&2
    exit 1
fi
if ! command -v jq > /dev/null; then
    echo "jq is required." 1>&2
    exit 1
fi

archs=$(skopeo inspect --raw "docker://${BASE_IMAGE}" | \
    jq -r '.manifests | .[] | .platform.architecture')
count=0
found=0
for arch in ${archs}; do
    if [ "${arch}" = "${INSPECTED_ARCH}" ]; then
        found=1
        break
    fi
    count=$(($count + 1))
done
if [ "${found}" != 1 ]; then
    echo "INSPECTED_ARCH: ${INSPECTED_ARCH} not found." 1>&2
    exit 1
fi

skopeo inspect --raw "docker://${BASE_IMAGE}" | \
    jq -r ".manifests | .[$count] | .digest"
