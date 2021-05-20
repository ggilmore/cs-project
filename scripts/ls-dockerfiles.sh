#!/usr/bin/env bash

set -euo pipefail

REPOSITORY_ROOT_RELATIVE_PATH="$(realpath --relative-to="$(pwd)" "$(dirname "${BASH_SOURCE[0]}")"/..)"

fd --glob Dockerfile "${REPOSITORY_ROOT_RELATIVE_PATH}"
