#!/bin/bash

MOUNT_FOLDER=$(pwd)

docker run \
	--rm \
	--interactive \
	--tty \
	--device /dev/sgx_enclave:/dev/sgx_enclave \
	--device /dev/sgx_provision:/dev/sgx_provision \
	-v /dev/sgx:/dev/sgx \
	-v ${MOUNT_FOLDER}:/workspace \
	notifierman/openenclave-sdk:latest
