#!/bin/bash

# paths
DOTFILES_PATH=$HOME/dotfiles
# SIXPLUS_PATH=$HOME/sixplus
LIQID_PATH=$HOME/workspace/liqid

# global vars :/
DOTFILE_PROJECTS=("liqid")

# liqid dev creds
# export GOOGLE_APPLICATION_CREDENTIALS=$DOTFILES_PATH/secrets/third-being-207111-4f836190fdfb.json

# liqid staging creds
export GOOGLE_APPLICATION_CREDENTIALS=$DOTFILES_PATH/secrets/liqid-staging-52654bff7a92.json

# liqid production creds
# export GOOGLE_APPLICATION_CREDENTIALS=$DOTFILES_PATH/secrets/liqid-terraform-production.json
