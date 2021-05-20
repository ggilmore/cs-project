#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euxo pipefail

VERSION="${VERSION:-"$(./scripts/get-version-tag.sh)"}"

DOCKERHUB_USER="${DOCKERHUB_USER:-"ggilmore"}"
REPOSITORY="${DOCKERHUB_USER}/cs-project-app"
IMAGE="${REPOSITORY}:${VERSION}"

docker build --file src/Dockerfile -t "${IMAGE}" .
docker push "${IMAGE}"

LATEST_IMAGE="${REPOSITORY}:latest"

docker tag "${IMAGE}" "${LATEST_IMAGE}"
docker push "${LATEST_IMAGE}"
