pwda() {
    if [[ $PWD = $HOME ]]; then
        print "~";
    elif [[ $PWD == "/" ]]; then
        print "/";
    else
        print ${PWD##*/};
    fi;
}


stat() {
    if [[ $? == 0 ]]; then
        print "\E[;1;92m[!] "
    else
        print "\E[;1;91m[!] "
    fi
}

gbranch() {
    if git rev-parse > /dev/null 2>&1; then
        branch=$(git branch 2> /dev/null | grep '^*' | colrm 1 2)
        if [[ ! $branch ]]; then
            branch="<empty>"
        fi
        print " ( $branch)"
    fi
}

# Add in a title (seems to need to be between ^[ and ^G)
PS1=']0;${LOGNAME}@${HOST} [${TTY}]'


# If logged in as root, then the prompt is in red and has a #,
# otherwise, use the normal prompt with a $
if [[ $LOGNAME == "root" ]]; then
    if [[ $PDKSH == 0 ]]; then
        PS1=${PS1}$'\E[;1;37m$LOGNAME\E[;37m@\E[;1;37m${HOST}\E[0m:\E[;1;34m$(pwda)\E[;1;35m\E[;1;31m# '
    else
        PS1=${PS1}'\033[;1;37m$LOGNAME\033[;37m@\033[;1;37m${HOST}\033[0m:\033[;1;34m$(pwda)\033[;1;35m\033[;1;31m# '
    fi
else
    if [[ $PDKSH == 0 ]]; then
       PS1=${PS1}$'$(stat)\E[1;32m$LOGNAME\E[1;33m@\E[1;32m${HOST}\E[0m:\E[;1;34m$(pwda)\E[;1;35m$(gbranch)\E[;1;31]\E[0m$ '
    else
        PS1=${PS1}'\033[1;32m$LOGNAME\033[1;33m@\033[1;32m${HOST}\033[0m:\033[;1;34m$(pwda)\033[;1;35m$(gbranch)\033[;1;31]\033[0m$ '
    fi
fi
