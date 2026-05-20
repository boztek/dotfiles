# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/local/sbin:/sbin:$PATH"

# zsh-completions
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# Prompt
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# RPROMPT with time and jj revision
#RPROMPT='(${vcs_info_msg_1_:+$vcs_info_msg_1_}) %*'
RPROMPT='${vcs_info_msg_1_:+(${vcs_info_msg_1_})} %*'

## jj / git
source $HOME/.dotfiles/link/zsh-jj/zsh-jj.plugin.zsh

shot() {
  jj describe -m "$*"
  echo "📍 Shot called: $*"
  echo "   Do your work, then run: tcr"
}

alias jjl='jj log'
alias jjla="jj log -r 'all()'"
alias tcr='./tcr.sh'

# Activate mise
if type mise &>/dev/null
then
  eval "$($HOME/.local/bin/mise activate zsh)"
fi

if type java &>/dev/null
then
  compdef -d java
fi
