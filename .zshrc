# Customize prompt
# YYYY-MM-DD HH:MM:SS user@host ~/cwd (current-git-branch) $
color_my_prompt() {
    local __user_and_host="$USER@%m"
    local __cur_location="%~"
    local __git_branch_color=""
    local __git_branch="$(git branch 2> /dev/null | grep -e ^\* | sed -E  's/^\*\ (.+)$/\1/')"
    local __prompt_tail=""
    local __last_color=""
    export PS1="%D %* $__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}

color_my_prompt

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

#
# Aliases
#
alias la="ls -lah"
alias ll="ls -l"
alias l="ls"
alias bx="bundle exec"
alias mkdir="mkdir -p"
