if command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
elif command -v vim > /dev/null 2>&1; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

export VISUAL=$EDITOR
export FCEDIT=$EDITOR

export TTY=$(tty)
export HISTFILE="$HOME/.ksh_history_${TTY##*/}"
export HISTMASTER="$HOME/.ksh_history"

# Percentage in man pager
export MANPAGER='less -s -M +Gg'
