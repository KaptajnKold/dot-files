function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:/usr/local/mysql/bin/
export PATH=$PATH:~/bin:~/scripts/
export PATH=/usr/local/git/bin:$PATH
export PATH=$PATH:~/go/bin
PATH=$PATH:/usr/local/sbin

# Oracle Instant Client
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:~/instantclient_10_2

export CLICOLOR="YES"
# export LSCOLORS="Dxfxcxdxbxegedabagacad"
export HISTFILESIZE=10000 # the bash history should save 10000 commands
export MAVEN_OPTS='-Xms256m -Xmx500m'
# export MANPATH=/usr/local/git/man:$MANPATH
export EDITOR=vim
export VISUAL=vim

export GOPATH=~/go

#Aliases
alias la="ls -la"
alias ll="ls -l"
alias l="ls"
alias serve="python -m SimpleHTTPServer"
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
