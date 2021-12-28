
. $SH_CONF_DIR/environ.ksh
. $SH_CONF_DIR/aliases.ksh
. $SH_CONF_DIR/colors.ksh
. $SH_CONF_DIR/prompt.ksh

set -o emacs
set -o ignoreeof
set -o markdirs
set -o nounset

[[ "$PDKSH" == "0" ]] && trap 'pc=${.sh.command}' DEBUG


[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"

# Prevent the previous command's exit status from starting all new shell
# sessions with a failed command indicator
true
