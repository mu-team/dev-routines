Advanced `.bashrc` setup
========================

```bash

# == Upgrade prompt for git, venv and pyenv == #

# colors for `echo` command
txtblk='\033[0;30m' # Black
txtred='\033[0;31m' # Red
txtgrn='\033[0;32m' # Green
txtylw='\033[0;33m' # Yellow
txtblu='\033[0;34m' # Blue
txtpur='\033[0;35m' # Purple
txtcyn='\033[0;36m' # Cyan
txtwht='\033[0;37m' # White
txtrst='\033[00m'   # Reset

# colors for `prompt` integration
prompt_blk="\[${txtblk}\]" # Black
prompt_red="\[${txtred}\]" # Red
prompt_grn="\[${txtgrn}\]" # Green
prompt_ylw="\[${txtylw}\]" # Yellow
prompt_blu="\[${txtblu}\]" # Blue
prompt_pur="\[${txtpur}\]" # Purple
prompt_cyn="\[${txtcyn}\]" # Cyan
prompt_wht="\[${txtwht}\]" # White
prompt_rst="\[${txtrst}\]" # Reset

is_pyenv_env() {
    pyenv &> /dev/null  # check `pyenv` command exists by compare with `127` returned code
    if [ "$?" != "127" ]; then echo $(pyenv prefix | awk -F "/" '{print $6}'); fi
}

is_git_env() {
    git &> /dev/null  # check `git` command exists by compare with `127` returned code
    if [ "$?" != "127" ]; then echo $(git branch 2>/dev/null | grep "*" | awk '{print $2}'); fi
}

# configure prompt
PS1="${debian_chroot:+($debian_chroot)}"
PS1+="${prompt_red}\$?${prompt_cyn}|"
PS1+="\$(if [[ \$(is_pyenv_env) ]]; then printf '%s' \"${prompt_grn}\$(is_pyenv_env)${prompt_cyn}|\"; fi)"
PS1+="\$(if [[ \$(is_git_env)   ]]; then printf '%s' \"${prompt_wht}\$(is_git_env)${prompt_cyn}|\";   fi)"
PS1+="${prompt_ylw}\w${prompt_cyn}> ${prompt_rst}"

# source command does not work with parent shell, in this case it is PROMPT_COMMAND
alive() {
    if   [ -d   "env" ]; then source   env/bin/activate
    elif [ -d  ".env" ]; then source  .env/bin/activate
    elif [ -d  "venv" ]; then source  venv/bin/activate
    elif [ -d ".venv" ]; then source .venv/bin/activate
    fi
}

dead() {
    deactivate &> /dev/null || true  # for suppress returned code 1
}

PROMPT_COMMAND="alive"

# == Aliases == #
alias v27='virtualenv -p python2.7 .env && source .env/bin/activate'
alias v35='virtualenv -p python3.5 .env && source .env/bin/activate'
alias v36='virtualenv -p python3.6 .env && source .env/bin/activate'

alias up='sudo apt -y update && sudo apt -y upgrade && sudo apt -y autoclean && sudo apt -y autoremove'

```