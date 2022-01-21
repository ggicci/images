#!/usr/bin/env bash
#
# Install code extensions.
#
# Environments:
# - IO4_CODE_EXTENSIONS: the list of code extensions to install,
#                        separated by comma.


for name in $( echo ${IO4_CODE_EXTENSIONS} | sed 's/,/ /g' ); do
  echo "install code extension [ ${name} ]"
  /usr/bin/code-server --install-extension "${name}"
done
