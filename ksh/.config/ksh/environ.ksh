# Default text editor
if command -v nvim > /dev/null 2>&1; then
    export EDITOR=nvim
elif command -v vim > /dev/null 2>&1; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

export VISUAL=$EDITOR
export FCEDIT=$EDITOR

# Other default applications
export TERMINAL="st"
export BROWSER="surf"


# Shell Configuration
export TTY=$(tty)
export HISTDIR="$HOME/.ksh_history"
export HISTFILE="$HISTDIR/history_${TTY##*/}"
export HISTMASTER="$HISTDIR/history"


# XDG Directory Setup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Percentage in man pager
export MANPAGER='less -s -M +Gg'

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

export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"

# Put LARBS scripts onto the path
export PATH="$PATH:$HOME/.local/bin/statusbar"
export PATH="$PATH:$HOME/.local/bin/cron"
