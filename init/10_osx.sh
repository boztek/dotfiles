[[ "$OSTYPE" =~ ^darwin ]] || return 1

#Make sure homebrew is installed
if [[ ! "$(type -P brew)" ]]; then
    e_header "Installing Homebrew"
    true | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ "$(type -P brew)" ]]; then
    e_header "Updating Homebrew"
    brew update
fi

brew install git
brew install htop
brew install tree
brew install wget

# vmware fusion and vagrant
brew cask install vmware-fusion
brew cask install vagrant
if VAGRANT_PLUGIN=$(vagrant plugin list |grep vagrant-vmware-desktop); then
    e_header "$VAGRANT_PLUGIN already installed"
else
    brew cask install vagrant-vmware-utility
    vagrant plugin install vagrant-vmware-desktop
    vagrant plugin license vagrant-vmware-desktop .dotfiles/configs/vagrant-vmware-desktop.lic
fi

# JVM
$HOME/.dotfiles/scripts/jvm_dev.sh
brew install clojure

# Scheme
brew cask install racket

# Ruby
brew install rbenv
$HOME/.dotfiles/scripts/ruby_dev.sh

# Node
brew install nodenv
$HOME/.dotfiles/scripts/node_dev.sh
# brew install yarn

# Rust

# IDE
brew cask install visual-studio-code
brew cask install jetbrains-toolbox
