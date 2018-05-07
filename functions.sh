###########
# Utilities
###########

# opens local dotfiles file

edit_dotfiles() {
  vim $HOME/dotfiles-local/$1*
}

# Opens or creates a note to be edited
note() {
  $EDITOR ~/nexus/notes/"$*".txt
}

# Lists notes that meet a text pattern search
# beginning with the first arg passed
nls() {
  ls -c ~/nexus/notes/ | grep "$*"
}

shut_down_postgres() {
  pg_ctl -D /usr/local/var/postgres stop -s -m fast
}

##########
# Docker
##########
source ${DOTFILES_PATH}/docker/functions.sh

#########
# Projects
#########

for i in $DOTFILE_PROJECTS
do
  source ~/workspace/$i/dotfiles/functions.sh
done
