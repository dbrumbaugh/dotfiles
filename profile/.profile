# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Shell configuration information for KSH93/PDKSH
export SH_CONF_DIR="/etc/ksh" # Usually $HOME/.config, but is different on PSU machines
export FPATH="$SH_CONF_DIR/funcs"
export ENV="$SH_CONF_DIR/kshrc.ksh"

# Determine if the login shell is PDKSH or KSH93. This is used for
# configuring the prompt, among other things. Mostly here so I can use
# the same config on my computers and my OpenBSD servers.
if [[ $KSH_VERSION == *PD* ]]; then
    export PDKSH=1
else
    export PDKSH=0
fi

export HOST=`hostname -s`
