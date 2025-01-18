is_osx || return 1

# https://brew.sh
# The Missing Package Manager for macOS (or Linux)
if [[ ! "$(type -P brew)" ]]; then
    e_header "Installing Homebrew"
    # https://docs.brew.sh/Installation#unattended-installation
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi