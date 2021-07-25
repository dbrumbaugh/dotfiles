
. $SH_CONF_DIR/environ.ksh
. $SH_CONF_DIR/aliases.ksh
. $SH_CONF_DIR/prompt.ksh
. $SH_CONF_DIR/colors.ksh

set -o emacs
set -o ignoreeof
set -o markdirs
set -o nounset

trap 'pc=${.sh.command}' DEBUG
