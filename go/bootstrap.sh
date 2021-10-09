#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail


# Environment Variables
# * IO4_SOURCE_PROJECT_ROOT
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
  if [[ -d "${IO4_SOURCE_PROJECT_ROOT}/.git" ]]; then
    >&2 echo "io4go: source code already cloned, skip"
    return
  fi

  git clone "${IO4_SOURCE_REPO_URL}" "${IO4_SOURCE_PROJECT_ROOT}"
  echo "${IO4_SOURCE_PROJECT_ROOT}"
}

io4::install_code_extensions() {
  /usr/bin/code-server --install-extension "golang.go"
  /usr/bin/code-server --install-extension "eamodio.gitlens"
}

main() {
  io4::clone_source_code
  io4::install_code_extensions

  # Call code-server's entrypoint.sh
  /usr/bin/entrypoint.sh \
    --disable-telemetry \
    --disable-update-check \
    --bind-addr "0.0.0.0:80" \
    "${IO4_SOURCE_PROJECT_ROOT}"
}

main "$@"
