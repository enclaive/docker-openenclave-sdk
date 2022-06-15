#!/bin/bash

GO_VERSION="1.18.3"
IMAGE="notifierman/openenclave-sdk"
TAG="golang-${GO_VERSION}_0.1"

base_folder=$(dirname $(readlink -f $0))

docker build \
    --build-arg GO_VERSION=${GO_VERSION} \
    -t ${IMAGE}:${TAG} \
    ${base_folder}/
