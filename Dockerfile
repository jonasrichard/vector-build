FROM docker.io/debian:trixie-slim

LABEL org.opencontainers.image.url="https://vector.dev"
LABEL org.opencontainers.image.source="https://github.com/vectordotdev/vector"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates tzdata libsasl2-2 \
    && rm -rf /var/lib/apt/lists/*

COPY vector-repo/target/release/vector /usr/bin/vector

RUN ["vector", "--version"]

ENTRYPOINT ["/usr/bin/vector"]
