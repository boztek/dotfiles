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
brew cask install veracrypt

# Docker
brew cask install docker

# vmware fusion and vagrant
brew cask install vmware-fusion
brew cask install vagrant
if VAGRANT_PLUGIN=$(vagrant plugin list |grep vagrant-vmware-desktop); then
    e_header "$VAGRANT_PLUGIN already installed"
else
    brew cask install vagrant-vmware-utility
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

# Scheme
brew cask install racket-cs

# Ruby
brew install rbenv
$HOME/.dotfiles/scripts/ruby_dev.sh

# Node
brew install nodenv
$HOME/.dotfiles/scripts/node_dev.sh

# Rust

# IDE
brew cask install visual-studio-code
brew cask install jetbrains-toolbox

# Apps
brew cask install workflowy