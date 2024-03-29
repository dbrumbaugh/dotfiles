# Determine if the shell is PDKSH or KSH93. This is used for
# configuring the prompt, among other things. Mostly here so I can use
# the same config on my computers and my OpenBSD servers.
if [[ $KSH_VERSION == *PD* ]]; then
    export PDKSH=1
else
    export PDKSH=0
fi

# Default text editor
if command -v vis > /dev/null 2>&1; then
    export EDITOR=vis
else
    export EDITOR=vi
fi

export VISUAL=$EDITOR
export FCEDIT=$EDITOR

# Other default applications
export TERMINAL="st"
export BROWSER="vimb"

export CDPATH=":$HOME:$HOME/current-classes:$HOME/current-projects"

# Local bin folder, if applicable
if [[ -d "$USER_LOCAL/bin" ]] && [[ ":$PATH:" != *":$USER_LOCAL/bin:"* ]]; then
    PATH="$PATH:$USER_LOCAL/bin"
    PATH="$PATH:$USER_LOCAL/bin/statusbar"
fi

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
    export PATH="$PATH:$USER_LOCAL/go/bin"
fi


if [[ -d "$XDG_DATA_HOME/coursier/bin" ]] && [[ ":$PATH:" != *":$XDG_DATA_HOME/coursier/bin:"* ]]; then
    export PATH="$PATH:$XDG_DATA_HOME/coursier/bin"
fi

# Used for the pushd/popd/dirs functions
unset dir_stack
export dir_stack

# Percentage in man pager
export MANPAGER='less -s -M +Gg'
