# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Check if we're running on a PSU machine. If so, we want to use a
# different root directory for all our configuration stuff.
if [[ -d /export/home/$USER ]]; then
    export CHOME="/export/home/$USER"
else
    export CHOME="$HOME"
fi

# Shell configuration information for KSH93/PDKSH
export SH_CONF_DIR="$CHOME/.config/ksh"
export FPATH="$SH_CONF_DIR/funcs"
export ENV="$SH_CONF_DIR/shellrc.sh"

# XDG/User-level configuration setup
export USER_LOCAL="$CHOME/.local"
export XDG_CACHE_HOME="$CHOME/.cache"
export XDG_CONFIG_HOME="$CHOME/.config"

export XDG_DATA_HOME="$USER_LOCAL/share"
export XDG_STATE_HOME="$USER_LOCAL/state"

# X11 configuration variables
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

export TTY=$(tty)
export GPG_TTY=$TTY
export GNUPGHOME="$CHOME/.local/share/gnupg"
export PASSWORD_STORE_DIR="$CHOME/.local/share/passwords"

export PATH="/usr/local/sbin:/usr/sbin:$PATH"
# Local bin folder, if applicable
if [[ -d "$USER_LOCAL/bin" ]]; then
    PATH="$PATH:$USER_LOCAL/bin"
    PATH="$PATH:$USER_LOCAL/bin/statusbar"
fi

if command -v hostname > /dev/null 2>&1; then
    export HOST=$(hostname -s)
else
    export HOST=$(cat /etc/hostname)
fi

if [[ $TTY == /dev/tty1 ]]; then
    startx "$CHOME/.config/x11/xinitrc"
fi
