FROM notifierman/openenclave-sdk:base_0.1

ARG GO_VERSION=1.18.2

USER root
WORKDIR /tmp/
RUN wget -nv https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

USER sgx
ENV PATH "${PATH}:/usr/local/go/bin"
WORKDIR /workspace/
