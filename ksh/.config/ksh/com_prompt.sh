pwda() {
    if [[ $PWD = $HOME ]]; then
        printf "\001${blu_b}\002~"
    elif [[ $PWD == "/" ]]; then
        printf "\001${blu_b}\002/"
    else
        printf "\001${blu_b}\002${PWD##*/}"
    fi
}

gbranch() {
    if [[ -e $(git rev-parse --git-dir 2>/dev/null)/MERGE_HEAD ]]; then
        printf "\001${ylw_b}\002\001${clr}\002"
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

    [[ $ahead != "0" && ! -z $ahead ]] && printf "\001${grn}\002 "
    [[ $behind != "0" && ! -z $behind ]] && printf "\001${red}\002 "
}

glocalstat() {
    local_stat=$(git status --porcelain)
    echo "$local_stat" | grep "[MADRCU]" > /dev/null 2>&1 && printf "\001${ylw}\002 "
    echo "$local_stat" | grep "?" > /dev/null 2>&1 && printf "\001${red}\002 "
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
            printf "\001$clr\002(%s)" "$branch"
        else
            printf "\001$clr\002(%s %s\001$clr\002)" "$branch" "$syms"
        fi
    fi
}

conda_env() {
    if [[ -z ${CONDA_DEFAULT_ENV+x} ]]; then
        : #pass
    else
        printf "\001${blu2_b}\002( $CONDA_DEFAULT_ENV) "
    fi
}

prompt_char() {
    if [[ $LOGNAME == "root" ]]; then
        printf "\001${red_b}\002# \001${rst}\002\001${red}\002"
    else
        printf "\001${wht_b}\002\$ \001${rst}\002"
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
    printf "\001${clr1}\002$LOGNAME\001${clr2}\002@\001${clr1}\002$HOST"
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
        printf "\001${cyn2_b}\002[$hist]"
    else
        printf "\001${red_b}\002[$hist]->${cc}"
    fi
}
