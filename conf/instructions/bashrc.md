Advanced `.bashrc` setup
========================

```bash

# == Global colors == #

# for `echo`
txtblk='\033[0;30m' # Black
txtred='\033[0;31m' # Red
txtgrn='\033[0;32m' # Green
txtylw='\033[0;33m' # Yellow
txtblu='\033[0;34m' # Blue
txtpur='\033[0;35m' # Purple
txtcyn='\033[0;36m' # Cyan
txtwht='\033[0;37m' # White
txtrst='\033[00m'   # Reset

# for `prompt`
prompt_blk="\[${txtblk}\]" # Black
prompt_red="\[${txtred}\]" # Red
prompt_grn="\[${txtgrn}\]" # Green
prompt_ylw="\[${txtylw}\]" # Yellow
prompt_blu="\[${txtblu}\]" # Blue
prompt_pur="\[${txtpur}\]" # Purple
prompt_cyn="\[${txtcyn}\]" # Cyan
prompt_wht="\[${txtwht}\]" # White
prompt_rst="\[${txtrst}\]" # Reset

# == Upgrade prompt for git and pyenv == #

VIRTUAL_ENV_DISABLE_PROMPT=1

alive_env() {
    PS1="${debian_chroot:+($debian_chroot)}${prompt_red}\$?${prompt_cyn}|"

    local python_env=$(pyenv prefix 2>/dev/null | awk -F "/" '{print $6}')
    if [ ! -z ${python_env} ]; then
        PS1=${PS1}"${prompt_grn}${python_env}${prompt_cyn}|"
    fi
    
    local git_env=$(git branch 2>/dev/null | grep '*' | awk '{print $2}')
    if [ ! -z ${git_env} ]; then
        PS1=${PS1}"${prompt_wht}${git_env}${prompt_cyn}|"
    fi
    
    PS1=${PS1}"${prompt_ylw}\w${prompt_cyn}|> ${prompt_rst}"
}

PROMPT_COMMAND="alive_env"

# == Aliases == #

alias up='sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove'

```
