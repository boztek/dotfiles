# Load nodenv- and npm-related functions.
source $DOTFILES/source/50_node.sh init

# Install latest stable Node.js, set as default, install global npm modules.
nodenv_install lts

# brew install yarn --without-node
