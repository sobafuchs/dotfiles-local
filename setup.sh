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
