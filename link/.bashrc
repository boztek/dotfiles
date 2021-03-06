# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=~/bin:~/.dotfiles/bin:/usr/local/bin:/sbin:$PATH

# if [ -d "~/.rbenv" ]; then
#     export PATH=~/.rbenv/bin:$PATH
#     eval "$(rbenv init -)"
#     rbenv global 1.9.3-p392
# fi

# alias veracrypt on os x machines
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias veracrypt='/Applications/Veracrypt.app/Contents/MacOS/VeraCrypt --text'
fi
alias mntp='veracrypt --pim=0 -k "" --protect-hidden=no ~/.dotfiles/private.vc ~/.dotfiles/private/'
alias unmntp='veracrypt --dismount ~/.dotfiles/private/'
