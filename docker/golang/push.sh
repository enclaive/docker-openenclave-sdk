#!/bin/bash

GO_VERSION="1.18.3"
IMAGE="notifierman/openenclave-sdk"
TAG="golang-${GO_VERSION}_0.1"

docker push ${IMAGE}:${TAG}