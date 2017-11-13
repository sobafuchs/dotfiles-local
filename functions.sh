###########
# Utilities
###########

# Opens or creates a note to be edited
note() {
  $EDITOR ~/nexus/notes/"$*".txt
}

# Lists notes that meet a text pattern search
# beginning with the first arg passed
nls() {
  ls -c ~/nexus/notes/ | grep "$*"
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
