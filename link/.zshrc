# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=~/bin:~/.dotfiles/bin:/usr/local/bin:/sbin:$PATH

# alias veracrypt on os x machines
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias veracrypt='/Applications/Veracrypt.app/Contents/MacOS/VeraCrypt --text'
fi

# ruby environment management
hash rbenv &> /dev/null && eval "$(rbenv init -)"

# node.js environment management
hash nodenv &> /dev/null && eval "$(nodenv init -)" && export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
