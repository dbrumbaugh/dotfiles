# store color codes as variables
if [[ $PDKSH == 1 ]]; then
    SIG='\033['
else
    SIG='\E['
fi

blk="${SIG}30m"
red="${SIG}31m"
grn="${SIG}32m"
ylw="${SIG}33m"
blu="${SIG}34m"
mag="${SIG}35m"
cyn="${SIG}36m"
wht="${SIG}37m"


blk2="${SIG}90m"
red2="${SIG}91m"
grn2="${SIG}92m"
ylw2="${SIG}93m"
blu2="${SIG}94m"
mag2="${SIG}95m"
cyn2="${SIG}96m"
wht2="${SIG}97m"

blk_b="${SIG}1;30m"
red_b="${SIG}1;31m"
grn_b="${SIG}1;32m"
ylw_b="${SIG}1;33m"
blu_b="${SIG}1;34m"
mag_b="${SIG}1;35m"
cyn_b="${SIG}1;36m"
wht_b="${SIG}1;37m"

blk2_b="${SIG}1;90m"
red2_b="${SIG}1;91m"
grn2_b="${SIG}1;92m"
ylw2_b="${SIG}1;93m"
blu2_b="${SIG}1;94m"
mag2_b="${SIG}1;95m"
cyn2_b="${SIG}1;96m"
wht2_b="${SIG}1;97m"

rst="${SIG}0m"



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
