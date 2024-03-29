# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Convenience aliases
alias qemu=qemu-system-x86_64
alias cls=clear
alias stowh="stow -t $CHOME"
alias sctlu="systemctl --user"
alias sctl="systemctl"
alias jctlu="journalctl --user"
alias jctl="journalctl"
alias su="su -l -c \"cd `pwd`; ksh\""
alias dl-audio="yt-dlp -x -f bestaudio/best"
alias mkdir="mkdir -p"
alias t="todo.sh"
alias cdh="cd $CHOME"

alias public-ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias quit="savehist; rm $HISTFILE; exit"
alias exa="exa --icons --git"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# for easier debugging
alias gdb="CK_FORK=no gdb"

# force commands to use the appropriate configuration files
alias startx="startx $XINITRC"
alias mbsync="mbsync -c \"$XDG_CONFIG_HOME/isync/mbsyncrc\""
alias davmail="davmail \"$XDG_CONFIG_HOME/davmail/davmail.properties\""
alias newsboat="newsboat -u $XDG_DATA_HOME/feeds -c $XDG_CACHE_HOME/newsboat/cache -C $XDG_CONFIG_HOME/newsboat/config"
