#!/bin/usr/bash
# Determine branch
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

BOLD_GREEN='\[\033[01;32m\]'
COLOR_NONE='\[\033[00m\]'
BOLD_BLUE='\[\033[01;34m\]'
BOLD_MAGENTA='\[\033[01;35m\]'
YELLOW='\[\033[00;33m\]'

# Apply based on which shell is running
if [ -n "$ZSH_VERSION" ]; then
    setopt PROMPT_SUBST
    PROMPT='%n@%m %~%F{blue}$(parse_git_branch)%f %# '
elif [ -n "$BASH_VERSION" ]; then
    PS1="${BOLD_GREEN}\u@\h${COLOR_NONE}:${BOLD_BLUE}\w${BOLD_MAGENTA}$(parse_git_branch)${YELLOW}$ "
fi
