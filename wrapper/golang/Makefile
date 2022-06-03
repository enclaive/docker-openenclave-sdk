# Copyright (c) Open Enclave SDK contributors.
# Licensed under the MIT License.

.PHONY: all build clean run simulate

OE_CRYPTO_LIB := mbedtls
export OE_CRYPTO_LIB

USER_ID = $(shell id -u)
GROUP_ID = $(shell id -g)
MOUNT_DIR = $(shell pwd)

all: build

build:
	$(MAKE) -C enclave
	$(MAKE) -C host
	cd ./api/ && go build

buildInsideDocker:
	docker run \
		--rm \
		--interactive \
		--tty \
		--user ${USER_ID}:${GROUP_ID} \
		--device /dev/sgx_enclave:/dev/sgx_enclave \
		--device /dev/sgx_provision:/dev/sgx_provision \
		-v /dev/sgx/:/dev/sgx/ \
		-v ${MOUNT_DIR}:/workspace/ \
		notifierman/openenclave-sdk:golang-0.1 \
		bash -ic "make build"

startDockerShell:
	docker run \
		--rm \
		--interactive \
		--tty \
		--user ${USER_ID}:${GROUP_ID} \
		--device /dev/sgx_enclave:/dev/sgx_enclave \
		--device /dev/sgx_provision:/dev/sgx_provision \
		-v /dev/sgx/:/dev/sgx/ \
		-v ${MOUNT_DIR}:/workspace/ \
		notifierman/openenclave-sdk:golang-0.1 \
		bash -i

clean:
	$(MAKE) -C enclave clean
	$(MAKE) -C host clean
	rm -rf api/sample-api cmake-build-debug/

run:
	cd api/ && ./sample-api
