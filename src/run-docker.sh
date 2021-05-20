#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euxo pipefail

VERSION="${VERSION:-"$(./scripts/get-version-tag.sh)"}"

DOCKERHUB_USER="${DOCKERHUB_USER:-"ggilmore"}"
REPOSITORY="${DOCKERHUB_USER}/cs-project-app"
IMAGE="${REPOSITORY}:${VERSION}"

docker run "${IMAGE}"
