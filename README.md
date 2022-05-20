# docker-openencalveSDK

Build environment for enclavation of applications using the OpenEnclave framework.

## Execute the pre-build image

A pre-build image can be started from any desired folder by executing the `run.sh` script.
It makes use of the `notifierman/openenclave-sdk:latest` image and automatically mounts the current working directory (`pwd`) at `/workspace` into the docker container.

## Build the Docker image from source

To build the Docker image locally from source one may simply execute the `build.sh` script from the main folder of this repository.
