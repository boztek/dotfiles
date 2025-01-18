# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="~/bin:~/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/sbin:$PATH"

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# alias veracrypt on os x machines
if [[ "$OSTYPE" =~ ^darwin ]]; then
    alias veracrypt='/Applications/Veracrypt.app/Contents/MacOS/VeraCrypt --text'
fi
alias mntp='veracrypt --pim=0 -k "" --protect-hidden=no ~/.dotfiles/private.vc ~/.dotfiles/private/'
alias unmntp='veracrypt --dismount ~/.dotfiles/private/ && pushd -q ~/.dotfiles && git restore private.vc && popd -q'
alias savep='veracrypt --dismount ~/.dotfiles/private/ && pushd -q ~/.dotfiles && git add private.vc && git commit -am"save sec" && popd -q && mntp'

# https://www.0xf00.com/posts/vagrant/errors
alias vagrant_vmware_restart='sudo launchctl stop com.vagrant.vagrant-vmware-utility && sudo launchctl start com.vagrant.vagrant-vmware-utility'

# ruby environment management
hash rbenv &> /dev/null && eval "$(rbenv init -)"

# node.js environment management
hash nodenv &> /dev/null && eval "$(nodenv init -)" && export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="$HOME/.composer/vendor/bin:$PATH"

# Prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
RPROMPT='%*'
## git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT="\$vcs_info_msg_0_ $RPROMPT"
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
