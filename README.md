# docker-openfang

[![Build](https://github.com/flukschander/docker-openfang/actions/workflows/build.yml/badge.svg)](https://github.com/flukschander/docker-openfang/actions/workflows/build.yml)
[![Docker Pulls](https://badgen.net/docker/pulls/flukschander/openfang)](https://hub.docker.com/r/flukschander/openfang)

Multi-arch Docker images for [OpenFang](https://github.com/RightNow-AI/openfang), the Agent Operating System.

## Features

- **Multi-Arch Support**: Native `linux/amd64` and `linux/arm64` builds.
- **Lightweight**: Multi-stage build based on `debian:bookworm-slim`.
- **Automated**: CI/CD via GitHub Actions pushing to Docker Hub, Quay.io, and GHCR.

## Usage

### Run with Docker

```bash
docker run -d \
  --name openfang \
  -p 4200:4200 \
  -v openfang_data:/data \
  flukschander/openfang:latest
```

### Run with Docker Compose

```yaml
services:
  openfang:
    image: flukschander/openfang:latest
    ports:
      - "4200:4200"
    volumes:
      - openfang_data:/data
    restart: unless-stopped

volumes:
  openfang_data:
```

## Registries

Images are available on the following registries:

- **Docker Hub**: `flukschander/openfang`
- **GHCR**: `ghcr.io/flukschander/openfang`

## Configuration

The image uses the following environment variables and volumes:

- `OPENFANG_HOME`: Set to `/data` by default.
- Volume `/data`: Used for persistent storage of configuration, logs, and agent state.

## License

This repository is licensed under the MIT License. OpenFang itself is licensed under its own respective licenses (Apache-2.0 or MIT).
