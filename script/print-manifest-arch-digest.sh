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

skopeo inspect --raw "docker://${BASE_IMAGE}" | jq -r ".manifests[] | select(.platform.architecture == \"${MANIFEST_ARCH}\") | .digest"
