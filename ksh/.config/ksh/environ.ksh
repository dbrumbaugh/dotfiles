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

# XDG/User-level configuration setup
if [[ -d "/export/home/$USER" ]]; then
    export USER_LOCAL="/export/home/$USER/.local"
    export XDG_CACHE_HOME="/export/home/$USER/.cache"
    export XDG_CONFIG_HOME="/export/home/$USER/.config"
else
    export USER_LOCAL="$HOME/.local"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_CONFIG_HOME="$HOME/.config"
fi

export XDG_DATA_HOME="$USER_LOCAL/share"
export XDG_STATE_HOME="$USER_LOCAL/state"

# X11 configuration variables
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

# Local bin folder, if applicable
if [[ -d "$USER_LOCAL/bin" ]] && [[ ":$PATH:" != *":$USER_LOCAL/bin:"* ]]; then
    PATH="$PATH:$USER_LOCAL/bin"
    PATH="$PATH:$USER_LOCAL/bin/statusbar"
fi

# Shell Configuration
export TTY=$(tty)
export HISTDIR="$XDG_DATA_HOME/.ksh_history"
export HISTFILE="$HISTDIR/history_${TTY##*/}"
export HISTMASTER="$HISTDIR/history"

# Set up NVM (node version manager) if applicable
if [[ -d $USER_LOCAL/src/nvm ]]; then
    export NVM_DIR="$USER_LOCAL/src/nvm"
    test -s "$NVM_DIR/nvm.sh" && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi

# Set up CARGO if applicable
if [[ -d $USER_LOCAL/cargo ]]; then
    export CARGO_HOME="$USER_LOCAL/cargo"
    . "$CARGO_HOME/env"
fi

# Set up RUSTUP if applicable
if [[ -d $USER_LOCAL/rustup ]]; then
    export RUSTUP_HOME="$USER_LOCAL/rustup"
fi

# Anaconda/Miniconda Setup, if applicable
if [[ -d $USER_LOCAL/anaconda3 ]]; then
    export CONDA_DIR="$USER_LOCAL/anaconda3"

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
fi

# Go setup, if applicable
if [[ -d "$USER_LOCAL/go/bin" ]] && [[ ":$PATH:" != *":$USER_LOCAL/go/bin:"* ]]; then
    PATH="$PATH:$USER_LOCAL/go/bin"
fi

# Used for the pushd/popd/dirs functions
unset dir_stack
export dir_stack

# Percentage in man pager
export MANPAGER='less -s -M +Gg'
