# Copyright (c) Open Enclave SDK contributors.
# Licensed under the MIT License.

.PHONY: all build clean run simulate

OE_CRYPTO_LIB := mbedtls
export OE_CRYPTO_LIB

DOCKER_USER_ID = 1000

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
		--user ${DOCKER_USER_ID}:${DOCKER_USER_ID} \
		--device /dev/sgx_enclave:/dev/sgx_enclave \
		--device /dev/sgx_provision:/dev/sgx_provision \
		-v /dev/sgx/:/dev/sgx/ \
		-v $(shell pwd):/workspace/ \
		notifierman/openenclave-sdk:golang-0.1 \
		bash -ic "make build"

startDockerShell:
	docker run \
		--rm \
		--interactive \
		--tty \
		--user ${DOCKER_USER_ID}:${DOCKER_USER_ID} \
		--device /dev/sgx_enclave:/dev/sgx_enclave \
		--device /dev/sgx_provision:/dev/sgx_provision \
		-v /dev/sgx/:/dev/sgx/ \
		-v $(shell pwd):/workspace/ \
		notifierman/openenclave-sdk:golang-0.1 \
		bash -i

clean:
	$(MAKE) -C enclave clean
	$(MAKE) -C host clean
	rm -rf api/sample-api cmake-build-debug/

run:
	cd api/ && ./sample-api
