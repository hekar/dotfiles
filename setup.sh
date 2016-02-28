#!/bin/sh

if python -mplatform | grep -q -i ubuntu; then
  sudo apt-get update -y
  sudo apt-get install -y git git-gui vim g++ zsh
elif python -mplatform | grep -q -i fedora; then
  # Install RPM fusion
  sudo dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  sudo dnf install -y git vim gcc-c++ zsh git-gui
  sudo dnf install -y https://github.com/atom/atom/releases/download/v1.5.3/atom.x86_64.rpm
elif python -mplatform | grep -q -i centos; then
  sudo dnf install -y git vim gcc-c++ zsh git-gui
  sudo dnf install -y https://github.com/atom/atom/releases/download/v1.5.3/atom.x86_64.rpm
  echo "CentOS is not fully supported"
elif python -mplatform | grep -q -i opensuse; then
  sudo zypper in -y git vim gcc-c++ zsh git-gui
else
  echo "Your Linux distribution is not supported"
fi

# Install vim-n-home
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
git clone git@github.com:hekar/vim-n-home.git &&
cp -R ./vim-n-home/. ~/ &&
mv ~/.git ~/.homegit &&
rm -Rf ./vim-n-home

