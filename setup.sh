sh ./brew.sh
sh ./gems.sh

# clone dotfiles repo if it doesnt exist
if [ -d ~/dotfiles ]
then
  git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles
fi

brew tap thoughtbot/formulae
brew install rcm
env RCRC=$HOME/dotfiles/rcrc rcup

# install pip
sudo python2.7 -m ensurepip --default-pip

# install awscli
 pip3 install awscli --upgrade --user

# create dinghy vm using xhyve provider
dinghy create --provider xhyve

# install soccer-cli
pip install soccer-cli
