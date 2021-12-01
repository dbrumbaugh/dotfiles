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
export HISTDIR="$HOME/.ksh_history"
export HISTFILE="$HISTDIR/history_${TTY##*/}"
export HISTMASTER="$HISTDIR/history"

# Percentage in man pager
export MANPAGER='less -s -M +Gg'

# XDG Stuff
export XDG_CONFIG_HOME="$HOME/.config"


# Used for the pushd/popd/dirs functions
unset dir_stack
export dir_stack

# Anaconda install directory (configure per computer)
export CONDA_DIR="/usr/local/anaconda3"

# Anaconda configuration variables
export CONDA_AUTO_ACTIVATE_BASE="false"
export CONDA_CHANGEPS1="false"

# Anaconda Initialization
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$CONDA_DIR/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
        . "$CONDA_DIR/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_DIR/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
