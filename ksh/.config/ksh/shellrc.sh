# this file is sourced when running sh too, so we should
# avoid using any non-POSIX structures if this is the case
if [ "$0" != "sh" ]; then
    # Non POSIX shell environment
    export TTY=$(tty)
    
    . $SH_CONF_DIR/environ.sh
    . $SH_CONF_DIR/aliases.sh
    . $SH_CONF_DIR/colors.sh
    . $SH_CONF_DIR/plan9.sh

    export SHELL="${0##*/}"
    if [[ $SHELL == "bash" ]]; then 
        . $SH_CONF_DIR/bash_prompt.sh
    elif [[ $SHELL == "ksh93" || $SHELL == "-ksh93" ]]; then
        . $SH_CONF_DIR/ksh_prompt.sh
        trap 'pc=${.sh.command}' DEBUG
        set -o multiline
        export HISTFILE="${XDG_DATA_HOME}/ksh93_history"
    elif [[ "$SHELL" == "ksh" ]]; then
        # OpenBSD ksh
        . $SH_CONF_DIR/ksh_prompt.sh
        export HISTFILE="${XDG_DATA_HOME}/pdksh_history"
    fi

    set -o emacs
    set -o ignoreeof
    set -o nounset
fi

true
