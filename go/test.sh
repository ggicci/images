#!/usr/bin/env bash

PROJECT_ID=d0d20a53-8bf2-421d-aa5b-7d216134dadc
PROJECT_HOME="${PWD}/io4-projects/${PROJECT_ID}/home"
mkdir -p "${PROJECT_HOME}"

docker run \
  -v "${PROJECT_HOME}:/home/coder" \
  -e "PASSWORD=19911110" \
  -e "IO4_SOURCE_PROJECT_ROOT=/home/coder/httpin" \
  -e "IO4_SOURCE_REPO_URL=https://github.com/ggicci/httpin" \
  -p "127.0.0.1:8080:80" \
  ggicci/io4-go:latest
