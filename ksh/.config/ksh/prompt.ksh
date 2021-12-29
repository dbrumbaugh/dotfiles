pwda() {
    if [[ $PWD = $HOME ]]; then
        print "${blu_b}~"
    elif [[ $PWD == "/" ]]; then
        print "${blu_b}/"
    else
        print "${blu_b}${PWD##*/}"
    fi
}

stat() {
        cc=$?

        if [[ $cc == 0 ]]; then
            print "$cyn2_b[!] "
        elif [[ $cc == 127 && "$PDKSH" == "0" ]]; then
            print "$(cnf ${pc%% *})"
            print "$red_b[!] "
        else
            print "$red_b$cc->[!] "
        fi
}

gbranch() {
    if [[ "$1" == "0" ]]; then
        clr=${red2_b}
    else
        clr=${mag_b}
    fi

    branch=$(git branch 2> /dev/null | grep '^*' | colrm 1 2)
    [[ -z $branch ]] && branch="<empty>"

    if [[ -e $(git rev-parse --git-dir 2>/dev/null)/MERGE_HEAD ]]; then
        sym="${ylw_b}${clr}"
    else
        sym=""
    fi

    print -n " ${clr}($sym $branch"
}

gremotestat() {
    remote_stat=$(git status --porcelain=v2 --branch | grep "branch.ab")
    ahead=$(echo "$remote_stat" | cut -d " " -f 3 | tr -d "+")
    behind=$(echo "$remote_stat" | cut -d " " -f 4 | tr -d "-")

    if [[ $ahead != "0" && ! -z $ahead ]]; then
        ahead_sym="${grn} "
    else
        ahead_sym=""
    fi

    if [[ $behind != "0" && ! -z $behind ]]; then
        behind_sym="${red} "
    else
        behind_sym=""
    fi

    pstr="$ahead_sym$behind_sym"
    if [[ -z $pstr ]]; then
        : pass
    else
        print -n " $pstr"
    fi
}

glocalstat() {
    if [[ "$1" == "0" ]]; then
        clr=${red2_b}
    else
        clr=${mag_b}
    fi

    local_stat=$(git status --porcelain)

    if echo "$local_stat" | grep "[MADRCU]" > /dev/null 2>&1; then
        local_sym="${ylw} "
    else
        local_sym=""
    fi

    if echo "$local_stat" | grep "?" > /dev/null 2>&1; then
        untracked_sym="${red} "
    else
        untracked_sym=""
    fi

    pstr="$local_sym$untracked_sym"
    if [[ -z $pstr ]]; then
        : pass
    elif [[ "$1" == "0" ]]; then
        print -n " $pstr"
    else
        print -n "$pstr"
    fi

    print "${clr})"
}


gprompt() {
    # check if we are in a git repository
    if git rev-parse > /dev/null 2>&1; then
        # check if the repository has a remote
        if [ -z $(git remote) ]; then
            gbranch 0
            glocalstat 0
        else
            gbranch 1
            gremotestat 1
            glocalstat 1
        fi
    fi
}

conda_env() {
    if [[ -z ${CONDA_DEFAULT_ENV+x} ]]; then
        : #pass
    else
        print "${blu2_b}( $CONDA_DEFAULT_ENV) "
    fi
}

prompt_char() {
    if [[ $LOGNAME == "root" ]]; then
        print "${red_b}# ${rst}${red}"
    else
        print "${wht_b}\$ ${rst}"
    fi
}

user_host() {
    if [[ "$LOGNAME" == "root" ]]; then
        clr1=$red_b
        clr2=$mag_b
    else
        clr1=$grn_b
        clr2=$ylw_b
    fi
    print "${clr1}$LOGNAME${clr2}@${clr1}$HOST"
}

# Add in a title (seems to need to be between ^[ and ^G)
TITLE=']0;${LOGNAME}@${HOST} [${TTY}]'

PS1=${TITLE}'$(stat)$(conda_env)$(user_host):$(pwda)$(gprompt)$(prompt_char)'
