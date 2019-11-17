#!/bin/bash

# set -xe
# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

if [ -d "$HOME/.sdkman" ]; then
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    SDKMAN=$(sdk version)
    e_header "$SDKMAN already installed"
else
    curl -s "https://get.sdkman.io" | bash
    sdk install java 11.0.5.hs-adpt
    sdk install kotlin
fi
