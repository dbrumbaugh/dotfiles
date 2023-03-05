# store color codes as variables
export SIG="\033["
export END=""

blk="${SIG}30m${END}"
red="${SIG}31m${END}"
grn="${SIG}32m${END}"
ylw="${SIG}33m${END}"
blu="${SIG}34m${END}"
mag="${SIG}35m${END}"
cyn="${SIG}36m${END}"
wht="${SIG}37m${END}"


blk2="${SIG}90m${END}"
red2="${SIG}91m${END}"
grn2="${SIG}92m${END}"
ylw2="${SIG}93m${END}"
blu2="${SIG}94m${END}"
mag2="${SIG}95m${END}"
cyn2="${SIG}96m${END}"
wht2="${SIG}97m${END}"

blk_b="${SIG}1;30m${END}"
red_b="${SIG}1;31m${END}"
grn_b="${SIG}1;32m${END}"
ylw_b="${SIG}1;33m${END}"
blu_b="${SIG}1;34m${END}"
mag_b="${SIG}1;35m${END}"
cyn_b="${SIG}1;36m${END}"
wht_b="${SIG}1;37m${END}"

blk2_b="${SIG}1;90m${END}"
red2_b="${SIG}1;91m${END}"
grn2_b="${SIG}1;92m${END}"
ylw2_b="${SIG}1;93m${END}"
blu2_b="${SIG}1;94m${END}"
mag2_b="${SIG}1;95m${END}"
cyn2_b="${SIG}1;96m${END}"
wht2_b="${SIG}1;97m${END}"

rst="${SIG}0m${END}"



# Man page colors
# This does not seem to support variable expansion, so we
# need to leave this as-is.
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;35m'     # begin bold
export LESS_TERMCAP_us=$'\E[1;31m'    # begin underline
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# colored GCC warnings and errors
export GCC_COLORS="error=01;31:warning=01;33:note=01;36:caret=01;32:locus=01:quote=01"

# enable color support of commands
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    alias ip='ip -c'
fi
