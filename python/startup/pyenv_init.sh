#!/usr/bin/env bash

main() {
  if [[ ! -d ~/.pyenv ]]; then
    echo "copy pyenv from /opt/pyenv to ~/.pyenv"
    cp -r /opt/pyenv ~/.pyenv
  fi

  local default_version="$( ls /opt/pyenv/versions )" # must be one
  if [ ! -e ~/.pyenv/version ]; then
    pyenv global "${default_version}"
  fi

  eval "$( pyenv init - )"
}

main "$@"