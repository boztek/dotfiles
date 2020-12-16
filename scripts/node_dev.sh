#!/bin/bash

################################################
#Setup nodenv, compile node and install yarn.

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

e_header "Checking for nodenv"
if NODENV=$(nodenv init -); then
    e_header "found nodenv"
    eval "$NODENV"
    N_NODENV_VERSIONS_INSTALLED=$(nodenv versions |wc -l |tr -d ' ')
else
    e_error "nodenv not found"
    exit 1
fi

set -e
set -o pipefail

e_arrow "node.js versions installed: $N_NODENV_VERSIONS_INSTALLED"
if [[ $N_NODENV_VERSIONS_INSTALLED -lt 1 ]]; then
    e_header "Installing Node with nodenv"
    curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash
    LATEST_NODE_LTS=$(nodenv install --list|grep ^14. |grep "^14\.[0-9]*\.[0-9]*$" |tail -n1)
    e_arrow "installing node.js $LATEST_NODE_LTS"
    nodenv install $LATEST_NODE_LTS
    e_arrow "setting global node.js to $LATEST_NODE_LTS"
    nodenv global $LATEST_NODE_LTS
else
    # Install yarn
    [[ -d "$HOME/.yarn" ]] || curl -o- -L https://yarnpkg.com/install.sh | bash
    e_arrow "installed yarn"
    e_success "node.js environment set up"
fi
