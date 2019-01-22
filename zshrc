#!/bin/bash

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

export PATH="$PATH:$HOME/workspace/liqid/liqid-infrastructure/bin"
autoload -U promptinit; promptinit
prompt pure

HISTSIZE=600

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/roonie/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/roonie/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/roonie/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/roonie/google-cloud-sdk/completion.zsh.inc'; fi
