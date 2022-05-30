FROM ubuntu:20.04

ENV TZ=Europe/Berlin
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y \
        gnupg2 \
        wget \
        make

RUN echo 'deb [arch=amd64] https://download.01.org/intel-sgx/sgx_repo/ubuntu focal main' | tee /etc/apt/sources.list.d/intel-sgx.list && \
    wget -qO - https://download.01.org/intel-sgx/sgx_repo/ubuntu/intel-sgx-deb.key | apt-key add - && \
    echo "deb http://apt.llvm.org/focal/ llvm-toolchain-focal-10 main" | tee /etc/apt/sources.list.d/llvm-toolchain-focal-10.list && \
    wget -qO - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
    echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/20.04/prod focal main" | tee /etc/apt/sources.list.d/msprod.list && \
    wget -qO - https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y \
        clang-10 \
        libssl-dev \
        gdb \
        libsgx-enclave-common \
        libsgx-quote-ex \
        libprotobuf17 \
        libsgx-dcap-ql \
        libsgx-dcap-ql-dev \
        az-dcap-client \
        open-enclave

RUN adduser --gecos "" --disabled-password --uid 1000 sgx

USER sgx

RUN echo "echo Trying to source /opt/openenclave/share/openenclave/openenclaverc ..." >> /home/sgx/.bashrc && \
    echo ". /opt/openenclave/share/openenclave/openenclaverc" >> /home/sgx/.bashrc && \
    echo "echo Done." >> /home/sgx/.bashrc

WORKDIR /workspace/
