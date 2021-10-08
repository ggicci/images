#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# Environment Variables
# * IO4_SOURCE_PROJECT_NAME
# * IO4_SOURCE_REPO_URL

# NOTE: current working directory is /home/coder
# TODO(ggicci): introduce io4run: https://github.com/ggicci/io4run

abort() {
  { if [ "$#" -eq 0 ]; then cat -
    else echo "io4go: $*"
    fi
  } >&2
  exit 1
}

io4::clone_source_code() {
  [[ "${IO4_SOURCE_PROJECT_NAME}" = *"/"* ]] && abort "invalid IO4_SOURCE_PROJECT_NAME: slash not allowed"

  local project_root="/home/coder/${IO4_SOURCE_PROJECT_NAME}"

  if [[ -d "${project_root}/.git" ]]; then
    >&2 echo "io4go: source code already cloned, skip"
    return
  fi

  git clone "${IO4_SOURCE_REPO_URL}" "${project_root}"
  echo "${project_root}"
}

io4::install_code_extensions() {
  /usr/bin/code-server --install-extension "golang.go"
  /usr/bin/code-server --install-extension "eamodio.gitlens"
}

main() {
  local project_root

  project_root="$( io4::clone_source_code )"
  io4::install_code_extensions

  echo "Current working directory: $( pwd )"

  # Call code-server's entrypoint.sh
  /usr/bin/entrypoint.sh \
    --disable-telemetry \
    --disable-update-check \
    --bind-addr "0.0.0.0:8080" \
    "${project_root}"
}

main "$@"
