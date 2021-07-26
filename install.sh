#!/bin/sh

# Makes symbolic links from the home dir to this repo
# Will prompt before overwriting any existing files

abs() { printf '%s/%s' "$(pwd)" "$1"; }

ln -si "$(abs zshenv)" ~/.zshenv
ln -si "$(abs zshrc)" ~/.zshrc
ln -si "$(abs vimrc)" ~/.vimrc
