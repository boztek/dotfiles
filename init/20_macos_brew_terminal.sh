is_osx || return 1
[[ "$(type -P brew)" ]] || return 1

e_header "Installing and setting up terminal"

brew install --cask ghostty

# Put terminfo somewhere that emacsclient can find it
# otherwise TERM=xterm-ghostty emacsclient -nw .
# results in *ERROR*: Terminal type xterm-ghostty is not defined
if [[ ! -f ~/.terminfo/78/xterm-ghostty ]]; then
  tic -x -o ~/.terminfo ~/.dotfiles/resources/terminfo/ghostty.terminfo
fi
