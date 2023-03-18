. ${SH_CONF_DIR}/com_prompt.sh

    #elif [[ $cc == 127 && "$PDKSH" == "0" ]]; then
     #   print "$(cnf ${pc%% *})"
      #  print "$red_b[!] "

# Add in a title (seems to need to be between ^[ and ^G)
TITLE="]0;${LOGNAME}@${HOST} [${TTY}]:${SHELL}"

PS1=$'\a\r\a${TITLE}\a$(stat $? $((HISTCMD-1))) $(conda_env)$(user_host):$(pwda)$(gprompt)$(prompt_char)'
