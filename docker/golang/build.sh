#!/bin/bash

IMAGE="notifierman/openenclave-sdk"
TAG="golang-0.1"

base_folder=$(dirname $(readlink -f $0))

docker build \
    -t ${IMAGE}:${TAG} \
    ${base_folder}/
