# aliases vi to vim
alias vi="vim"
alias git="hub"

for i in $DOTFILE_PROJECTS
do
  source ~/workspace/$i/dotfiles/aliases.sh
done
