#!/bin/bash

set -xe

# Install default packages
suse_packages="git
    vim
    gcc-c++
    zsh
    git-gui
    docker
    htop
    cmake
    stow
    make
    go-doc
    libgit2-devel
    automake
    tmux
"

sudo zypper -q refresh
sudo zypper -q install -y $suse_packages || true

# Install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 16
nvm alias default 16

# ============================
# Create additional folders  in ~/

mkdir $HOME/bin \
    $HOME/code \
    $HOME/share \
    $HOME/tmp \
    $HOME/.vim_backup || true
rm -Rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos || true

pushd $HOME/share
# Setup applications in ~/share

popd # $HOME/share

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

# Install dotfiles
git clone git@github.com:hekar/dotfiles.git &&
rm ~/.bashrc ~/.profile ~/.gitconfig ~/.zshrc &&
cd ./dotfiles &&
stow .

