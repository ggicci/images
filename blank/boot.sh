#!/usr/bin/env bash

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

main() {
  # Run shell scripts: /opt/io4run/startup/*.sh
  for script in /opt/io4run/startup/*.sh; do
    echo "io4run: ${script}"
    "${script}"
  done

  # Call code-server's entrypoint.sh
  /usr/bin/entrypoint.sh \
    --disable-telemetry \
    --disable-update-check \
    --bind-addr "0.0.0.0:80" \
    "${IO4_WORKSPACE_ROOT}"
}

main "$@"
