pwda() {
    if [[ $PWD = $HOME ]]; then
        printf "${blu_b}~"
    elif [[ $PWD == "/" ]]; then
        printf "${blu_b}/"
    else
        printf "${blu_b}${PWD##*/}"
    fi
}

gbranch() {
    if [[ -e $(git rev-parse --git-dir 2>/dev/null)/MERGE_HEAD ]]; then
        printf "${ylw_b}${clr}"
    else
        printf ""
    fi

    branch=$(git branch 2> /dev/null | grep '^*' | colrm 1 2)
    [[ -z $branch ]] && branch="<empty>"
    printf " $branch"
}

gremotestat() {
    remote_stat=$(git status --porcelain=v2 --branch | grep "branch.ab")
    ahead=$(echo "$remote_stat" | cut -d " " -f 3 | tr -d "+")
    behind=$(echo "$remote_stat" | cut -d " " -f 4 | tr -d "-")

    [[ $ahead != "0" && ! -z $ahead ]] && printf "${grn} "
    [[ $behind != "0" && ! -z $behind ]] && printf "${red} "
}

glocalstat() {
    local_stat=$(git status --porcelain)
    echo "$local_stat" | grep "[MADRCU]" > /dev/null 2>&1 && printf "${ylw} "
    echo "$local_stat" | grep "?" > /dev/null 2>&1 && printf "${red} "
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
        printf "${blu2_b}( $CONDA_DEFAULT_ENV) "
    fi
}

prompt_char() {
    if [[ $LOGNAME == "root" ]]; then
        printf "${red_b}# ${rst}${red}"
    else
        printf "${wht_b}\$ ${rst}"
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
    printf "${clr1}$LOGNAME${clr2}@${clr1}$HOST"
}

stat() {
    cc=$1

    if [[ $# < 2 || $2 == "0" ]]; then
        hist="-"
    else
        hist="$2"
    fi

    if [[ $cc == 127 && ! -z ${pc+x} ]]; then
        print "$(cnf ${pc%% *})"
    fi

    if [[ $cc == 0 ]]; then
        printf "${cyn2_b}[$hist]"
    else
        printf "${red_b}[$hist]->${cc}"
    fi
}
