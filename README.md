# Kickstart ![CI](https://github.com/ggilmore/kickstart/workflows/CI/badge.svg)

@sourcegraph/distribution: Beyond the boilerplate below, I've added:

1. Go scripts
1. Go linters (and in CI)
1. Hadolint Dockerfile linter
1. A default Dockerfile for the "app" (look in `src/`)
1. A script to build+push the Docker image (this will probably require modifications to tweak the username for the repo). See `just docker-build`
1. A script to run the project via the Docker image (`just run`) - This will need to be tweaked when you add the compose file, etc.

You should be able to get away without needing a bunch of tooling for the small amount of javascript needed for the TODO app. All I'm imagining is a basic form that has a javascript callback to insert a new row (with the form contents) in an HTML table.

---

Kickstart is my personal template repository that bootstaps:

- The [`just` command runner](https://github.com/casey/just) from https://github.com/casey/just
- Scripts that check style / formatting via:
  - [`dhall format`/`dhall-lint`](https://dhall-lang.org/): https://dhall-lang.org/
  - [`shellcheck`](https://www.shellcheck.net/): https://www.shellcheck.net/
  - [`shfmt`](https://github.com/mvdan/sh): https://github.com/mvdan/sh
  - [`prettier`](https://prettier.io/): https://prettier.io/
- A Github Actions CI pipeline powered by [dhall](https://dhall-lang.org/) that enforces all of the above
- `deno` to assist with writing scripts that would be too messy for bash

# Dependencies

- [asdf version manager](https://asdf-vm.com/#/core-manage-asdf-vm?id=install)

# Install

1. Add the following asdf plugins:

- dhall
  - `asdf plugin-add dhall`
- shellcheck
  - `asdf plugin-add dhall`
- shfmt
  - `asdf plugin-add shfmt`
- fd
  - `asdf plugin-add fd`
- yarn
  - `asdf plugin-add yarn`
- deno
  - `asdf plugin-add deno`
- node
  - ```bash
    # https://github.com/asdf-vm/asdf-nodejs#install
    asdf plugin-add nodejs
    ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    ```
- just
  - `asdf plugin-add just https://github.com/ggilmore/asdf-just.git`

1. Run `asdf install` to install all the tools specified in [.tool-versions](./.tool-versions)
1. Run `just install` to install all the packages

# Usage

Run `just all` to render the CI pipeline, format, and lint all files

# License

See [LICENSE](LICENSE) © [Geoffrey Gilmore](https://github.com/ggilmore/)
