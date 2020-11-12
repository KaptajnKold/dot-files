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

# Source secrets
source $HOME/Dropbox/dotfiles/.tokens

# Source environment local to this machine
if [[ -f $HOME/.local_env ]]; then
    source $HOME/.local_env
else
    echo "No local environment overrides."
fi

# Source environment related to my employer
if [[ $WORK_DIR ]] && [[ -f $WORK_DIR/.env ]]; then
  source $WORK_DIR/.env
else
    echo "No work dir set up on this machine or no work environment overrides."
fi

export PATH=$HOME/scripts:$HOME/bin:$HOME/go/bin:$PATH

# Use gnu tools installed via Homebrew, unprefixed. E.g. grep instead of ggrep
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"

export EDITOR="/usr/local/bin/mate -w"

export CLICOLOR="YES"

HOMEBREW_NO_ANALYTICS=1

export GOPATH=$HOME/go

# Save history
export SAVEHIST=10000000
export HISTSIZE=10000000
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify

# History completion using arrow keys
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Set RBEnv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# ... and JEnv
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


export PATH="/usr/local/sbin:$PATH"

# # Let Java use the system trust store instead of its own
# export JAVA_TOOL_OPTIONS=-Djavax.net.ssl.trustStoreType=KeychainStore
