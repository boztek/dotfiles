#!/bin/bash
set -e
set -o pipefail

################################################
#Setup rbenv, compile ruby, and install bundler.

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

if RBENV=$(rbenv init -); then
    e_success "found rbenv"
    eval "$RBENV"
else
    e_error "rbenv non found"
    exit 1
fi

# Install latest Ruby 2.6 with rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
N_RBENV_VERSIONS_INSTALLED=$(rbenv versions |wc -l |tr -d ' ')
if [[ N_RBENV_VERSIONS_INSTALLED -lt 2 ]]; then
    LATEST_2_6_VERSION=$(rbenv install --list|grep ^2. |grep "^2\..\.[0-9]*$" |tail -n1)
    e_arrow "installing $LATEST_2_6_VERSION"
    rbenv install $LATEST_2_6_VERSION
    e_arrow "setting global ruby to $LATEST_2_6_VERSION"
    rbenv global $LATEST_2_6_VERSION
else
    e_success "rbenv setup"
fi

# sudo apt-get update
# sudo apt-get install -yy --no-install-recommends build-essential libssl-dev

# git clone https://github.com/sstephenson/rbenv ~/.rbenv
# git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# source ~/.bashrc

# rbenv install 1.9.3-p392
# source ~/.bashrc

# gem install --no-rdoc --no-ri bundler
# rbenv rehash
