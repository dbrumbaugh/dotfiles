# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
alias qemu=qemu-system-x86_64
alias cls=clear

# Set up a vim alias, based on currently installed
# text editor

if command -v nvim > /dev/null 2>&1; then
    alias vim=nvim
elif !command -v vim > 2/dev/null >&1; then
    alias vim=vi
fi

alias public-ip="dig +short myip.opendns.com @resolver1.opendns.com"

alias quit="savehist; rm $HISTFILE; exit"
alias exa="exa --icons --git"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# for easier debugging
alias gdb="CK_FORK=no gdb"

alias startx="startx $XINITRC"

# for email access (using custom configuration files)
alias mbsync="mbsync -c \"$XDG_CONFIG_HOME/isync/mbsyncrc\""
alias davmail="davmail \"$XDG_CONFIG_HOME/davmail/davmail.properties\""
