#!/bin/bash

IMAGE="notifierman/openenclave-sdk"
TAG="base_0.1"
SGX_USER_ID=1000

build_dir=$(dirname $(readlink -f $0))

docker build \
    --build-arg SGX_USER_ID=${SGX_USER_ID} \
    -t ${IMAGE}:${TAG} \
    ${build_dir}/
