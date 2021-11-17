#!/bin/bash

# set -xe
# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

e_header "Setting up Lendi development environment"

brew install awscli
yarn global add @lendi/liam
yarn global add @lendi/lcd

alias lendi_dev="eval $(liam reset); eval $(liam assume -e development -r poweruser)"
