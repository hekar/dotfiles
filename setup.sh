#!/bin/sh

deb_packages="git git-gui vim g++ zsh docker docker-compose"
deb_atom="https://github.com/atom/atom/releases/download/v1.5.3/atom-amd64.deb"
deb_dropbox="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"

rhel_packages="git vim gcc-c++ zsh git-gui docker docker-compose"
rhel_atom="https://github.com/atom/atom/releases/download/v1.5.3/atom.x86_64.rpm"
rhel_dropbox="https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm"

if python -mplatform | grep -q -i ubuntu; then
  sudo apt-get update -y && sudo apt-get install -y $deb_packages
  wget $deb_atom
  wget $deb_dropox
  sudo dpkg -i $deb_atom
  sudo dpkg -i $deb_packages
  sudo apt-get install -f
elif python -mplatform | grep -q -i fedora; then
  # Install RPM fusion
  sudo dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  sudo dnf install -y $rhel_packages $rhel_atom $rhel_dropbox
elif python -mplatform | grep -q -i centos; then
  sudo dnf install -y $rhel_packages $rhel_atom $rhel_dropbox
  echo "CentOS is not fully supported"
elif python -mplatform | grep -q -i opensuse; then
  sudo zypper in -y $rhel_packages
else
  echo "Your Linux distribution is not supported"
fi

# Install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 4 && nvm install 5
nvm alias default 4

# Install Atom Text Editor packages
apm install sync-settings editorconfig linter linter-eslint atom-beautify

# Install vim-n-home
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
git clone git@github.com:hekar/vim-n-home.git &&
cp -R ./vim-n-home/. ~/ &&
mv ~/.git ~/.homegit &&
rm -Rf ./vim-n-home

