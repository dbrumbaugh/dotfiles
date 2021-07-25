# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

export SH_CONF_DIR="$HOME/.config/ksh"
export FPATH="$SH_CONF_DIR/funcs"
export ENV="$SH_CONF_DIR/kshrc.ksh"

if [[ $KSH_VERSION == *PD* ]]; then
    export PDKSH=1
else
    export PDKSH=0
fi

# include user bin folder on PATH
if [[ -d "$HOME/bin" ]] && ![[ ":$PATH:" != *":$HOME/bin"* ]]; then
    PATH="$PATH:$HOME/bin"
fi

if [[ -d "$HOME/.local/bin" ]] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    PATH="$PATH:$HOME/.local/bin"
fi

# include user's go bin folder on PATH
if [[ -d "$HOME/go/bin" ]] && [[ ":$PATH:" != *":$HOME/go/bin:"* ]]; then
    PATH="$PATH:$HOME/go/bin"
fi

# if rustup/cargo is installed, source the env file
if [[ -r "$HOME/.cargo/env" ]];  then
    . "$HOME/.cargo/env"
fi

#export PATH
export HOST=`hostname -s`
