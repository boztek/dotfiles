is_osx || return 1
[[ "$(type -P brew)" ]] || return 1

e_header "Installing essential brews"

brew install git
brew install htop
brew install tree
brew install wget

brew install gpg
