# docker-openencalveSDK

Build environment for enclavation of applications using the OpenEnclave framework.

## The `openenclave-sdk` images

- `base` – The _core image_ of this project which provides a baseline for more complex images. Based on Ubuntu 20.04 with a ready to use installation of the [OpenEnclave SDK](https://github.com/openenclave/openenclave).
- `golang` – Extends the _base image_ by an installation of [Go](https://go.dev/).

### Execute pre-built images

A pre-build image can be started from any desired folder by executing the `docker/<image_name>/run.sh` script.
It makes use of the corresponding `notifierman/openenclave-sdk:<image_name>-<current_version>` image and automatically mounts the current working directory (`pwd`) at `/workspace/` into the docker container.

### Build an image from source

To build an image locally from source one may simply execute the corresponding build script located at `docker/<image_name>/build.sh`.

## OpenEnclave wrapper templates

The main purpose of the following _wrapper templates_ is to provide an elegant starting point on how to interact with an enclave – written in C using the [OpenEnclave SDK](https://github.com/openenclave/openenclave) – from a different programming language.

## golang

The _golang wrapper template_ consists of three submodules:

- `enclave` – Library of functions that should be executed inside the trusted environment of an SGX enclave.
- `host` – initializes the _enclave_ and calls the trusted library functions. Further explanations can be found at the [OpenEnclave SDK](https://github.com/openenclave/openenclave) project.
- `api` – the final API program which is able to use all features of [Go](https://go.dev/) as well as being able to invoke functions of the _host module_ to interact with the underlying _enclave_.
