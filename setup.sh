#!/bin/bash

suse_packages="git vim gcc-c++ zsh git-gui docker htop cmake stow make go-doc libgit2-devel automake tmux"
chrome_package="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

shopt -s expand_aliases
alias zyp_in='sudo zypper install -y'

sudo zypper refresh
zyp_in $suse_packages
zyp_in $chrome_package

# Install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 16
nvm alias default 16

# ============================
# Create additional folders  in ~/

mkdir $HOME/bin
mkdir $HOME/code
mkdir $HOME/share
mkdir $HOME/tmp
mkdir $HOME/.vim_backup
rm -Rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

# ============================
# Setup applications in ~/share

pushd $HOME/share
popd # $HOME/share

# Install dotfiles
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
git clone git@github.com:hekar/dotfiles.git &&
rm ~/.bashrc ~/.profile ~/.gitconfig ~/.zshrc &&
cd ./dotfiles &&
stow .

