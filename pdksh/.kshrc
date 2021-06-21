export EDITOR="nvim"
export VISUAL=$EDITOR
export HISTFILE="$HOME/.ksh_history"

export HOST=`hostname -s`

# Man page colors (maybe?)
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;35m'     # begin bold
export LESS_TERMCAP_so=$'\E[01;44;37m' # begin reverse video
export LESS_TERMCAP_us=$'\E[01;31m'    # begin underline
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

# Percentage in man pager
export MANPAGER='less -s -M +Gg'

pwda() {
    if [[ $PWD = $HOME ]] then
        print "~";
    elif [[ $PWD == "/" ]] then
        print "/";
    else
        print ${PWD##*/}; 
    fi;
}

gbranch() {
    if git rev-parse > /dev/null 2>&1; then
        print " ( $(git branch 2> /dev/null | grep '^*' | colrm 1 2))"
    fi
}

PS1='\033[1;32m$LOGNAME\033[1;33m@\033[1;32m${HOST}\033[0m:\033[;1;34m$(pwda)\033[;1;35m$(gbranch)\033[0m$ '

set -o emacs
set -o ignoreeof
set -o markdirs
set -o nounset


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

alias qemu=qemu-system-x86_64
alias cls=clear
