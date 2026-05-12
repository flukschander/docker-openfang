FROM --platform=$BUILDPLATFORM debian:bookworm-slim AS builder

ARG OPENFANG_VERSION=0.6.4
ARG TARGETARCH

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && case "${TARGETARCH}" in \
         amd64) ARCH="x86_64-unknown-linux-gnu" ;; \
         arm64) ARCH="aarch64-unknown-linux-gnu" ;; \
         *) echo "unsupported arch: ${TARGETARCH}" && exit 1 ;; \
       esac \
    && curl -fsSL "https://github.com/RightNow-AI/openfang/releases/download/v${OPENFANG_VERSION}/openfang-${ARCH}.tar.gz" \
       | tar xz -C /tmp \
    && mv /tmp/openfang /usr/local/bin/openfang

FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/bin/openfang /usr/local/bin/openfang

EXPOSE 4200
VOLUME /data
ENV OPENFANG_HOME=/data
ENTRYPOINT ["openfang"]
CMD ["start"]
