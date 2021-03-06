[[ "$OSTYPE" =~ ^darwin ]] || return 1

[[ ! -f /etc/fstab ]] && sudo cp $DOTFILES/resources/10_osx.fstab /etc/fstab

#Make sure homebrew is installed
if [[ ! "$(type -P brew)" ]]; then
    e_header "Installing Homebrew"
    true | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if [[ "$(type -P brew)" ]]; then
    e_header "Updating Homebrew"
    brew update
fi

if [ -d "/usr/local/Cellar/git" ]; then
    brew upgrade git
    brew upgrade htop
    brew upgrade tree
    brew upgrade wget
else
    brew install git
    brew install htop
    brew install tree
    brew install wget
fi

# Dotfile encrypted volume access
if [ -d "/Applications/Veracrypt.app" ]; then
    brew upgrade veracrypt
else
  e_error "Veracrypt not installed: brew install --cask veracrypt and restart"
  exit 1
fi

# Docker
brew install --cask docker

# vmware fusion and vagrant
# brew install --cask vmware-fusion
if [ -d "/usr/local/Caskroom/vagrant" ]; then
    brew upgrade --cask vagrant
else
    brew install --cask vagrant
fi
if VAGRANT_PLUGIN=$(vagrant plugin list |grep vagrant-vmware-desktop); then
    e_header "$VAGRANT_PLUGIN already installed"
else
    # brew install --cask vagrant-vmware-utility
    vagrant plugin install vagrant-vmware-desktop
    if [ ! -d "$HOME/.dotfiles/private" ]; then
        /Applications/Veracrypt.app/Contents/MacOS/VeraCrypt --text ~/.dotfiles/private.vc ~/.dotfiles/private/
        vagrant plugin license vagrant-vmware-desktop ~/.dotfiles/private/licenses/vagrant-vmware-desktop.lic
        /Applications/Veracrypt.app/Contents/MacOS/VeraCrypt --text -d ~/.dotfiles/private/
    else
        vagrant plugin license vagrant-vmware-desktop ~/.dotfiles/private/licenses/vagrant-vmware-desktop.lic
    fi
fi

# JVM
$HOME/.dotfiles/scripts/jvm_dev.sh
if [ -d "/usr/local/Cellar/clojure" ]; then
    brew upgrade clojure
else
    brew install clojure
fi

# Ruby
brew install rbenv
$HOME/.dotfiles/scripts/ruby_dev.sh

# Node
if [ -d "/usr/local/Cellar/nodenv" ]; then
    brew upgrade nodenv
    brew upgrade node-build
else
    brew install nodenv
fi
$HOME/.dotfiles/scripts/node_dev.sh

#Python
if [ -d "/usr/local/Cellar/python@3.8" ]; then
    brew upgrade python@3.8
else
    brew install python@3.8
fi
if [ -d "/usr/local/Cellar/python3" ]; then
    brew upgrade python3
else
    brew install python3
fi

# Rust

# Go
if [ -d "/usr/local/Cellar/go" ]; then
    brew upgrade go
else
    brew install go
fi

# emacs
if [ -d "/usr/local/Cellar/emacs-plus@27" ]; then
    brew upgrade emacs-plus
else
    brew tap d12frosted/emacs-plus
    brew install emacs-plus
fi

# jq
brew install jq

# IDE
brew install --cask visual-studio-code
brew install --cask jetbrains-toolbox
