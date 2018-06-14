#!/usr/bin/env bash

# Installs CLI tools w/ homebrew
sudo -v

while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# use latest version of homebrew
brew update

# Upgrade pre-existing formulae
brew upgrade

# install GNU core utilities because OSX core is outdated
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# instals GNU find utils like `find` and `xargs`
brew install findutils

# Install bash 4
brew install bash

# Install more recent versions of some OSX tools
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

################
# Brew Recipes
################

# survival
brew install vim
brew install git
brew install ack
brew install gdbm
brew install readline
brew install zsh
brew install bash-completion
brew install tmux
brew install reattach-to-user-namespace # necessary for copy paste w/ tmux

# devops
brew install terraform

# node
brew install yarn # for the js lovers

# ruby
brew install ruby-build

# IRC client
brew install irssi

# elixir
brew install elixir

# databases
brew install postgresql
brew install pgcli # syntax highlighting and autocomplete for pg cli

# security
brew install blackbox
brew install gpg-agent

# docker
brew install ctop # performance monitoring for docker containers
brew install docker-machine-driver-xhyve
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
brew tap codekitchen/dinghy
brew install dinghy

# nifty
brew install brew-cask # homebrew for macOS apps
brew install q # use SQL on csvs
brew install tree

# Removes outdated versions
brew cleanup

# useful stuff
brew install telnet
