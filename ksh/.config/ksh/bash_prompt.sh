. ${SH_CONF_DIR}/com_prompt.sh


TITLE='\e]0;${LOGNAME}@${HOST} [${TTY}]:${SHELL}\a'

PS1=${TITLE}'$(stat $? $((\!-1))) $(conda_env)$(user_host):$(pwda)$(gprompt)$(prompt_char)'
