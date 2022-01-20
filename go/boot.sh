#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# NOTE: current working directory is /home/coder

# Environment Variables (from .io4/image.yaml)
#
# * IO4_WORKSPACE_ROOT,   e.g. /home/coder/workspace
# * IO4_SOURCE_CODE,      e.g. https://github.com/ggicci/httpin
# * IO4_CODE_EXTENSIONS,  e.g. golang.go,eamodio.gitlens

# TODO(ggicci): introduce io4run: https://github.com/ggicci/io4run

abort() {
  { if [ "$#" -eq 0 ]; then cat -
    else echo "io4run: $*"
    fi
  } >&2
  exit 1
}

io4::clone_source_code() {
  mkdir -p "${IO4_WORKSPACE_ROOT}"

  if [[ -d "${IO4_WORKSPACE_ROOT}/.git" ]]; then
    >&2 echo "io4run: source code already cloned, skip"
    return
  fi

  git clone "${IO4_SOURCE_CODE}" "${IO4_WORKSPACE_ROOT}"
}

io4::install_code_extensions() {
  for name in $( echo ${IO4_CODE_EXTENSIONS} | sed 's/,/ /g' ); do
    echo "io4run: install code extension: ${name}"
    /usr/bin/code-server --install-extension "${name}"
  done
}

main() {
  io4::clone_source_code
  io4::install_code_extensions

  # Call code-server's entrypoint.sh
  /usr/bin/entrypoint.sh \
    --disable-telemetry \
    --disable-update-check \
    --bind-addr "0.0.0.0:80" \
    "${IO4_WORKSPACE_ROOT}"
}

main "$@"
