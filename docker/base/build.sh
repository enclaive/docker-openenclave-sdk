#!/bin/bash

IMAGE="notifierman/openenclave-sdk"
TAG="base-0.1"
SGX_USER_ID=1000

base_folder=$(dirname $(readlink -f $0))

docker build \
    --build-arg SGX_USER_ID=${SGX_USER_ID} \
    -t ${IMAGE}:${TAG} \
    ${base_folder}/
