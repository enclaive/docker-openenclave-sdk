#!/bin/bash

IMAGE="notifierman/openenclave-sdk"
TAG="latest"

docker build \
    -t ${IMAGE}:${TAG} \
    .

docker push ${IMAGE}:${TAG}
