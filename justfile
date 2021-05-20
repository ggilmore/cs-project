all: check format lint build

build: render-ci-pipeline

docker:
docker-build: docker
    ./src/build-docker.sh

run: docker-run
docker-run: docker-build
    ./src/run-docker.sh

render-ci-pipeline:
    ./scripts/render-ci-pipeline.sh

fmt: format
format: format-dhall prettier format-shfmt format-golang

lint: lint-dhall shellcheck lint-docker

check: check-dhall

prettier:
    yarn run prettier

format-dhall:
    ./scripts/dhall-format.sh

check-dhall:
    ./scripts/dhall-check.sh

lint-dhall:
    ./scripts/dhall-lint.sh

shellcheck:
    ./scripts/shellcheck.sh

format-shfmt:
    shfmt -w .

gofmt: format-golang
format-golang:
    ./scripts/go-format.sh

hadolint: lint-docker
lint-docker:
    ./scripts/hadolint.sh

install:
    just install-asdf
    just install-yarn

install-yarn:
    yarn

install-asdf:
    asdf install
