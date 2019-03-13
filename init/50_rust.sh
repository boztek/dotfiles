# Load nave- and npm-related functions.
source $DOTFILES/source/50_rust.sh init

[[ "$(type -P $HOME/.cargo/bin/rustup)" ]] && return 1

# Install rustup
curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path
