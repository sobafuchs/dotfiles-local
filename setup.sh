sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source ./vars.sh

# Install homebrew if it doesn't exist
if $(which brew) > /dev/null; then
	echo "Homebrew is already installed...moving on"
else
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo "Installing brew recipes"
sh ./brew.sh

echo "Changing default shell to zsh..."
sudo dscl . -create /Users/$USER UserShell $(which zsh)
sudo chsh -s $(which zsh)
source $DOTFILES_PATH/zshrc

echo "Creating symlink for .zshrc"
sudo ln -s $DOTFILES_PATH/zshrc $HOME/.zshrc
echo "Creating symlink for zsh utilities"
ln -s $DOTFILES_PATH/zsh/pure.zsh /usr/local/share/zsh/site-functions/prompt_pure_setup
ln -s $DOTFILES_PATH/zsh/async.zsh /usr/local/share/zsh/site-functions/async

# setup dotfiles
echo "Creating symlink for .tmux.conf"
sudo ln -s $DOTFILES_PATH/tmux.conf $HOME/.tmux.conf

echo "Creating symlink for .vimrc"
sudo ln -s $DOTFILES_PATH/vimrc $HOME/.vimrc

echo "Creating symlink for gitconfig..."
sudo ln -s $DOTFILES_PATH/gitconfig $HOME/.gitconfig


# install plug for vim plugins
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install pip
sudo python2.7 -m ensurepip --default-pip

# install awscli
 pip3 install awscli --upgrade --user

# create dinghy vm using xhyve provider
dinghy create --provider xhyve

# install Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 && \
  chmod +x minikube && \
  sudo mv minikube /usr/local/bin/

# Install hyperkit driver for minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \
  && chmod +x docker-machine-driver-hyperkit \
  && sudo mv docker-machine-driver-hyperkit /usr/local/bin/ \
  && sudo chown root:wheel /usr/local/bin/docker-machine-driver-hyperkit \
  && sudo chmod u+s /usr/local/bin/docker-machine-driver-hyperkit
