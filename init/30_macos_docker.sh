is_osx || return 1

# https://mise.jdx.dev/
# The front-end to your dev env
if [[ ! "$(type -P docker)" ]]; then
    e_header "Setting up docker"
    brew install orbstack
    open /Applications/OrbStack.app
fi
