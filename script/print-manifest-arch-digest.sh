#!/bin/bash
set -xeo pipefail

BASE_IMAGE=${1:-registry.access.redhat.com/ubi8}
MANIFEST_ARCH=${2:-arm64}

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
    if [ "${arch}" = "${MANIFEST_ARCH}" ]; then
        found=1
        break
    fi
    count=$(($count + 1))
done
if [ "${found}" != 1 ]; then
    echo "MANIFEST_ARCH: ${MANIFEST_ARCH} not found." 1>&2
    exit 1
fi

skopeo inspect --raw "docker://${BASE_IMAGE}" | \
    jq -r ".manifests | .[$count] | .digest"
