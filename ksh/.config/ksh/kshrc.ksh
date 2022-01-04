# this file is sourced when running sh too, so we should
# avoid loading all the ksh specific stuff in that case
if [ "$0" != "sh" ]; then
    . $SH_CONF_DIR/environ.ksh
    . $SH_CONF_DIR/aliases.ksh
    . $SH_CONF_DIR/colors.ksh
    . $SH_CONF_DIR/prompt.ksh
    . $SH_CONF_DIR/plan9.ksh

    set -o emacs
    set -o ignoreeof
    set -o markdirs
    set -o nounset

    if [[ "$PDKSH" == "0" ]]; then
        set -o multiline
        trap 'pc=${.sh.command}' DEBUG
    fi
fi

[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
true
