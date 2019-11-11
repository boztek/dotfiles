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

brew cask install visual-studio-code

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
if [ -d "./.sdkman" ]; then
    [[ -s ".sdkman/bin/sdkman-init.sh" ]] && source ".sdkman/bin/sdkman-init.sh"
    SDKMAN=$(sdk version)
    e_header "$SDKMAN already installed"
else
    curl -s "https://get.sdkman.io" | bash
fi
sdk install java 11.0.5.hs-adpt
sdk install kotlin
brew install clojure

# if JAVA_VERSION=$(java --version |head -n 1); then
#     e_header "$JAVA_VERSION already installed"
# else
#     sdk install java 11.0.5.hs-adpt
#     sdk install kotlin
# fi
