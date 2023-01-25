# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Shell configuration information for KSH93/PDKSH
export SH_CONF_DIR="$HOME/.config/ksh" # Usually $HOME/.config, but is different on PSU machines

export FPATH="$SH_CONF_DIR/funcs"
export ENV="$SH_CONF_DIR/kshrc.ksh"

export GPG_TTY=$(tty)
export GNUPGHOME="$HOME/.local/share/gnupg"
export PASSWORD_STORE_DIR="$HOME/.local/share/passwords"

if command -v hostname > /dev/null 2>&1; then
    export HOST=$(hostname -s)
else
    export HOST=$(cat /etc/hostname)
fi
