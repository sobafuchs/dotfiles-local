# Source project paths so they are globally accessible
source $HOME/dotfiles/vars.sh
source $HOME/dotfiles/aliases.sh
source $HOME/dotfiles/functions.sh

# vscode
function code {
  if [[ $# = 0 ]]
  then
    open -a "Visual Studio Code"
  else
    local argPath="$1"
    [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
    open -a "Visual Studio Code" "$argPath"
  fi
}

# awscli
export PATH=Library/Python/3.6/bin:$PATH

# functions
source $DOTFILES_PATH/functions.sh

# RVM
export PATH="$PATH:$HOME/.rvm/bin"

setopt prompt_subst
autoload -U colors && colors

# Use ❯ as the non-root prompt character; # for root
# Change the prompt character color if the last command had a nonzero exit code
PS1='$(ssh_info)%{$fg[magenta]%}%~%u $(git_info)%(?.%{$fg[blue]%}.%{$fg[red]%})%(!.#.❯)%{$reset_color%} '
# env vars for docker + dinghy
# export DOCKER_HOST=tcp://192.168.64.2:2376
# export DOCKER_CERT_PATH=/Users/varun/.docker/machine/machines/dinghy
# export DOCKER_TLS_VERIFY=1
# export DOCKER_MACHINE_NAME=dinghy
# export LOGENTRIES_RW_KEY=ca66e911-fa0d-48eb-b121-69e56423bbb4

