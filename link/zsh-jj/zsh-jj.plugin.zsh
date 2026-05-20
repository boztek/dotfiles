fpath+="${0:A:h}/functions"

autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable jj git

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

#prev
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:*:*' formats \
#    " %{$fg[blue]%}(%s %{$fg[red]%}%m%u%{$fg[yellow]%}%{$fg[magenta]%}%b%{$fg[blue]%})%{$reset_color%}" \
#    "%{$fg[yellow]%}%i%{$fg[grey]%}%r%{$reset_color%}"

# Set up both primary format (msg_0) and revision format (msg_1)
#zstyle ':vcs_info:*:*' formats \
#    " %{$fg[blue]%}(%s %{$fg[red]%}%m%u%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}" \
#    "%{$fg[yellow]%}%i%{$reset_color%}"  # %i is the revision

#prev
# Also set actionformats for when there's an action (conflict, etc)
#zstyle ':vcs_info:*:*' actionformats \
#    " %{$fg[blue]%}(%s %{$fg[red]%}%m%u%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%}|%{$fg[red]%}%a%{$fg[blue]%})%{$reset_color%}" \
#    "%{$fg[yellow]%}%i%{$reset_color%}"

# Enable max-exports to get multiple messages
#zstyle ':vcs_info:*:*' max-exports 2

zstyle ':vcs_info:*:*' max-exports 1

zstyle ':vcs_info:*:*' formats \
    $' %{\e[34m%}(%s %{\e[31m%}%u %{\e[33m%}%i%{\e[35m%}%b%{\e[34m%})%{\e[0m%}'
zstyle ':vcs_info:*:*' actionformats \
    $' %{\e[34m%}(%s %{\e[31m%}%u %{\e[33m%}%i%{\e[35m%}%b%{\e[34m%}|%{\e[31m%}%a%{\e[34m%})%{\e[0m%}'

#PROMPT="%B%{$fg[yellow]%}% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
#PROMPT+="\$vcs_info_msg_0_ "

#PROMPT="%B%{$fg[yellow]%}% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
#PROMPT+="\$vcs_info_msg_0_\$vcs_info_msg_1_ "

PROMPT="%B%{$fg[yellow]%}% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "
