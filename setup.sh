#!/usr/bin/env bash

set -xe

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install default packages
readarray -t packages < $SCRIPT_DIR/.default_packages

sudo pacman -Syu "${packages[@]}"

set +e

# Install https://github.com/asdf-vm/asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

set -e

# Install volta version manager
curl https://get.volta.sh | bash

$HOME/.volta/bin/volta install "node@18"

# ============================
# Create additional folders in ~

mkdir -p $HOME/bin \
    $HOME/c \
    $HOME/share \
    $HOME/tmp || true

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

set +e

# Install dotfiles
git clone git@github.com:hekar/dotfiles.git

rm ~/.bashrc
rm ~/.profile
rm ~/.gitconfig
rm ~/.zshrc
cd ./dotfiles
stow .

# Install tmuxp
pip install --user tmuxp || true

set -e

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
