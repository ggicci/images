#!/usr/bin/env bash

set -euo pipefail

IMAGE_PREFIX="io4io"
GIT_COMMIT="$( git rev-parse --short HEAD )"
GIT_TAG="$( git describe --exact-match --tags "$GIT_COMMIT" 2>/dev/null || true )"

show_build_status() {
  echo "Commit: ${GIT_COMMIT} Version: ${GIT_TAG:-[none]}"
}

main() {
  show_build_status

  if [[ "$GIT_TAG" == "" ]]; then
    echo "No tag found, skipping build"
    exit 0
  fi

  # TODO(ggicci): read release-matrix.txt to decide which images to build
}

main "$@"