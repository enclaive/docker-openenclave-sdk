FROM notifierman/openenclave-sdk:base-0.1

USER root
WORKDIR /tmp/
RUN wget -nv https://go.dev/dl/go1.18.2.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz && \
    rm go1.18.2.linux-amd64.tar.gz

USER sgx
ENV PATH "${PATH}:/usr/local/go/bin"
WORKDIR /workspace/
