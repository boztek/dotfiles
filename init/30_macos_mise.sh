is_osx || return 1

# https://mise.jdx.dev/
# The front-end to your dev env
if [[ ! "$(type -P mise)" ]]; then
    e_header "Installing Mise"
    # https://mise.jdx.dev/installing-mise.html
    
    mkdir -pv $HOME/.local/bin
    curl https://mise.jdx.dev/mise-latest-macos-arm64 > $HOME/.local/bin/mise
    chmod +x $HOME/.local/bin/mise

    # Shell completions
    e_header "Installing Mise zsh shell completions"
    mise use -g usage
    mise completion zsh > /tmp/_mise
    sudo mkdir -pv /usr/local/share/zsh/site-functions
    sudo mv /tmp/_mise /usr/local/share/zsh/site-functions

    mise install
    e_header "Installed development tools:"
    mise ls

    source $HOME/.zshrc
fi
