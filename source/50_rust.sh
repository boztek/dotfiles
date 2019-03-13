[[ "$1" != init && ! -e ~/.rustup ]] && return 1

export PATH

# Make sure $HOME/.cargo/bin directory is in your system's "PATH".
PATH="$HOME/.cargo/bin:$(path_remove $HOME/.cargo/bin)"
