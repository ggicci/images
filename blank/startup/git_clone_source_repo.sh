#!/usr/bin/env bash
#
# Clone a source code repository into the workspace.
#
# Environments:
# - IO4_WORKSPACE_ROOT: the root directory of the workspace.
# - IO4_SOURCE_CODE: the URL of the source code repository.


mkdir -p "${IO4_WORKSPACE_ROOT}"

if [[ -d "${IO4_WORKSPACE_ROOT}/.git" ]]; then
  >&2 echo "source code already cloned, skip"
  exit 0
fi

git clone "${IO4_SOURCE_CODE}" "${IO4_WORKSPACE_ROOT}"