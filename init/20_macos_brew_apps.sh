is_osx || return 1
[[ "$(type -P brew)" ]] || return 1

e_header "Installing essential apps"

brew install jetbrains-toolbox
