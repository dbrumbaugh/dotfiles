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
    cc=$?

    if [[ $cc == 0 ]]; then
        print "\E[;1;92m[!] "
    elif [[ $cc == 127 ]]; then
        print "$(/usr/lib/command-not-found ${pc%% *})"
        print "\E[;1;91m[!] "
    else
        print "\E[;1;91m[!] "
    fi
}

gstatus() {
    if git rev-parse > /dev/null 2>&1; then
        remote_stat=$(git status --porcelain=v2 --branch | grep "branch.ab")
        ahead=$(echo "$remote_stat" | cut -d " " -f 3 | tr -d "+")
        behind=$(echo "$remote_stat" | cut -d " " -f 4 | tr -d "-")

        if [[ $ahead != "0" ]]; then
            ahead_sym=""
        else
            ahead_sym=""
        fi

        if [[ $behind != "0" ]]; then
            behind_sym=""
        else
            behind_sym=""
        fi

        if git status --porcelain | grep "[MADRCU]" > /dev/null 2>&1; then
            local_sym=""
        else
            local_sym=""
        fi

        if git status --porcelain | grep "?" > /dev/null 2>&1; then
            untracked_sym=""
        else
            untracked_sym=""
        fi

        if [[ -z $ahead_sym ]] && [[ -z $behind_sym ]] && [[ -z $local_sym ]] && [[ -z $untracked_sym ]]; then
            printf ")"
        else
            printf " \E[;0;32m%s\E[;0m\E[;0;31m%s\E[;0m\E[;0;33m%s\E[;0m\E[;1;31m%s\E[;0m\E[;1;35m)" $ahead_sym $behind_sym $local_sym $untracked_sym
        fi
    fi
}

gbranch() {
    if git rev-parse > /dev/null 2>&1; then
        branch=$(git branch 2> /dev/null | grep '^*' | colrm 1 2)
        if [[ ! $branch ]]; then
            branch="<empty>"
        fi
        print " ( $branch"
    fi
}

conda_env() {
    if [[ -z ${CONDA_DEFAULT_ENV+x} ]]; then
        : #pass
    else
        print "( $CONDA_DEFAULT_ENV) "
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
        PS1=${PS1}$'$(stat)\E[1;36m$(conda_env)\E[1;32m$LOGNAME\E[1;33m@\E[1;32m${HOST}\E[0m:\E[;1;34m$(pwda)\E[;1;35m$(gbranch)\E[;1;31]$(gstatus)\E[0m$ '
    else
        PS1=${PS1}'\033[1;32m$LOGNAME\033[1;33m@\033[1;32m${HOST}\033[0m:\033[;1;34m$(pwda)\033[;1;35m$(gbranch)\033[;1;31]\033[0m$ '
    fi
fi
