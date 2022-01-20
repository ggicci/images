#!/usr/bin/env bash

WORKSPACE_ID=LS7V2ZnTQb4CEbFJZKg4
WORKSPACE_HOME="${PWD}/io4-workspaces/${WORKSPACE_ID}/home"
mkdir -p "${WORKSPACE_HOME}"

# docker run \
#   --security-opt=seccomp:unconfined \
#   -v "${WORKSPACE_HOME}:/home/coder" \
#   -e "PASSWORD=19911110" \
#   -e "IO4_WORKSPACE_ROOT=/home/coder/workspace" \
#   -e "IO4_SOURCE_CODE=https://github.com/ggicci/httpin" \
#   -e "IO4_CODE_EXTENSIONS=golang.go,eamodio.gitlens" \
#   -p "127.0.0.1:8888:80" \
#   io4io/go-1.16.13:0.1.0

docker-compose up
