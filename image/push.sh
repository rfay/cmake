#!/bin/bash

set -eu -o pipefail
DOCKER_IMAGE=randyfay/cmake

docker buildx create create --name cmake --use || true

docker buildx build --push --platform linux/amd64,linux/arm64 -t ${DOCKER_IMAGE} .
