#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"/..
set -euo pipefail

DOCKERFILES=()
mapfile -t DOCKERFILES < <(scripts/ls-Dockerfiles.sh)

function run_hadolint() {
  local file="$1"

  result=$(hadolint "$file" 2>&1)
  rc=$?

  if [ -n "$result" ]; then
    echo "${file}:"
    echo "$result"
    echo
  fi

  exit "$rc"
}
export -f run_hadolint

./scripts/parallel_run.sh run_hadolint {} ::: "${DOCKERFILES[@]}"
