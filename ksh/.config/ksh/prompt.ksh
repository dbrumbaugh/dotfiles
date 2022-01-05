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
    if [[ -e $(git rev-parse --git-dir 2>/dev/null)/MERGE_HEAD ]]; then
        print -n "${ylw_b}${clr}"
    else
        print -n ""
    fi

    branch=$(git branch 2> /dev/null | grep '^*' | colrm 1 2)
    [[ -z $branch ]] && branch="<empty>"
    print -n " $branch"
}

gremotestat() {
    remote_stat=$(git status --porcelain=v2 --branch | grep "branch.ab")
    ahead=$(echo "$remote_stat" | cut -d " " -f 3 | tr -d "+")
    behind=$(echo "$remote_stat" | cut -d " " -f 4 | tr -d "-")

    [[ $ahead != "0" && ! -z $ahead ]] && print -n "${grn} "
    [[ $behind != "0" && ! -z $behind ]] && print -n "${red} "
}

glocalstat() {
    local_stat=$(git status --porcelain)
    echo "$local_stat" | grep "[MADRCU]" > /dev/null 2>&1 && print -n "${ylw} "
    echo "$local_stat" | grep "?" > /dev/null 2>&1 && print -n "${red} "
}


gprompt() {
    # check if we are in a git repository
    if git rev-parse > /dev/null 2>&1; then
        # check if the repository has a remote
        if [[ -z $(git remote) ]]; then
            clr="$red2_b"
        else
            clr="$mag_b"
        fi

        branch="$(gbranch)"
        rem="$(gremotestat)"
        loc="$(glocalstat)"

        syms="$rem$loc"
        if [[ -z "$syms" ]]; then
            printf "$clr(%s)" "$branch"
        else
            printf "$clr(%s %s$clr)" "$branch" "$syms"
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
