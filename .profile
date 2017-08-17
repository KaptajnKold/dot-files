function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="\n\D{%F %T} $__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

# Source secrets
source ~/Dropbox/dotfiles/.tokens

# Source environment local to this machine
if [[ -f ~/.local_env ]]; then
    source ~/.local_env
fi

# Source environment related to my employer
if [[ -z $WORK_DIR ]] && [[ -f $WORK_DIR/.env ]]; then
  source $WORK_DIR/.env
fi

export PATH=~/scripts:~/bin:$PATH
export CDPATH=~/br:~/~go/src:$CDPATH

export EDITOR="mate -w"

export CLICOLOR="YES"

HOMEBREW_NO_ANALYTICS=1

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

HISTFILESIZE=10000000
HISTSIZE=10000000
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

export GOPATH=~/go

# Aliases
alias la="ls -lah"
alias ll="ls -l"
alias l="ls"
function mcd() { mkdir -p $1 && cd $1 }
function cdf() { cd *$1*/ }

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
