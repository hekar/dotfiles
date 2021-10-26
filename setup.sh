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

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1 || true

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

# Setup applications in ~/share
pushd $HOME/share
popd # $HOME/share

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

# Install dotfiles
git clone git@github.com:hekar/dotfiles.git &&
rm ~/.bashrc ~/.profile ~/.gitconfig ~/.zshrc &&
cd ./dotfiles &&
stow . || true

# Install asdf plugins
asdf_install () {
  $HOME/.asdf/bin/asdf plugin add $1 || true
  $HOME/.asdf/bin/asdf install $1 latest || true
  $HOME/.asdf/bin/asdf global $1 latest || true
}

asdf_install awscli
asdf_install terraform
asdf_install terragrunt
asdf_install nomad
asdf_install packer
asdf_install starship
asdf_install 'terraform-ls'
asdf_install 'terraform-docs'
asdf_install kubectl
asdf_install kubectx
