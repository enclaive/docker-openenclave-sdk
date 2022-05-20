#!/bin/bash

MOUNT_FOLDER=$(pwd)

docker run \
	--rm \
	--interactive \
	--tty \
	-v ${MOUNT_FOLDER}:/workspace \
	sgx:latest
