#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# NOTE: current working directory is /home/coder

# Clone source code from remote.
# Using environment variables:
# - SOURCE_CODE
io4::clone_source_code() {
  git clone "${SOURCE_CODE}" /tmp/source
  cd /tmp/source
  project_name="$( basename -s .git $( git config --get remote.origin.url ) )"

  project_root="/home/coder/${project_name}"
  mv /tmp/source "${project_root}"
  echo "${project_root}"
}

io4::install_code_extensions() {
  /usr/bin/code-server --install-extension "golang.go"
  /usr/bin/code-server --install-extension "dracula-theme.theme-dracula"
  /usr/bin/code-server --install-extension "eamodio.gitlens"
  # TODO(ggicci): use env vars?
}

main() {
  local project_root

  # FIXME(ggicci): introduce droplets
  project_root="$( io4::clone_source_code )"
  io4::install_code_extensions

  # Call code-server's entrypoint.sh
  /usr/bin/entrypoint.sh \
    --disable-telemetry \
    --disable-update-check
    --bind-addr "0.0.0.0:8080" \
    "${project_root}"
}

main "$@"