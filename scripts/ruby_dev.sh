#!/bin/bash

################################################
#Setup rbenv, compile ruby, and install bundler.

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

e_header "Checking for rbenv"
if RBENV=$(rbenv init -); then
    e_success "found rbenv"
    eval "$RBENV"
    N_RBENV_NON_SYSTEM_VERSIONS_INSTALLED="$(rbenv versions |grep -v "system" |wc -l |tr -d ' ')"
else
    e_error "rbenv non found"
    exit 1
fi

set -e
set -o pipefail

e_arrow "ruby versions installed: $N_RBENV_NON_SYSTEM_VERSIONS_INSTALLED"
if [[ $N_RBENV_NON_SYSTEM_VERSIONS_INSTALLED -eq 0 ]]; then
    e_header "Installing Ruby with rbenv"
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
    LATEST_2_VERSION=$(rbenv install --list|grep ^2. |grep "^2\..\.[0-9]*$" |tail -n1)
    e_arrow "installing ruby $LATEST_2_VERSION"
    rbenv install $LATEST_2_VERSION
    e_arrow "setting global ruby to $LATEST_2_VERSION"
    rbenv global $LATEST_2_VERSION
else
    e_success "ruby dev environment set up"
fi
