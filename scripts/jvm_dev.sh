#!/bin/bash

# set -xe
# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function e_error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function e_arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

e_header "Installing JVM environment"
if [ -d "$HOME/.sdkman" ]; then
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    SDKMAN=$(yes | sdk version)
    e_header "$SDKMAN already installed"
    yes | sdk update
    SDK_JAVA_NOT_INSTALLED=$(sdk current java |grep 'Not using any version of java' |wc -l |tr -d ' ')
    if [[ $SDK_JAVA_NOT_INSTALLED -eq 1 ]]; then
        sdk install java 17.0.4-tem
    else
        yes | sdk upgrade java
    fi
    LEIN_NOT_INSTALLED=$(sdk current leiningen |grep 'Not using any version of leiningen' |wc -l |tr -d ' ')
    if [[ $LEIN_NOT_INSTALLED -eq 1 ]]; then
        sdk install leiningen
    else
        yes | sdk upgrade leiningen
    fi
    KOTLIN_NOT_INSTALLED=$(sdk current kotlin |grep 'Not using any version of kotlin' |wc -l |tr -d ' ')
    if [[ $KOTLIN_NOT_INSTALLED -eq 1 ]]; then
        sdk install kotlin
    else
        yes | sdk upgrade kotlin
    fi
else
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk install java 17.0.4-tem
    sdk install kotlin
fi
