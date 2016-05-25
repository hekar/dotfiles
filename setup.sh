#!/bin/bash

generic_elixir="https://github.com/elixir-lang/elixir.git"

deb_packages="i3 git git-gui vim g++ zsh docker docker-compose htop"
deb_atom="https://github.com/atom/atom/releases/download/v1.5.3/atom-amd64.deb"
deb_dropbox="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
deb_elixir=""
deb_erlang=""

rhel_packages="i3 git vim gcc-c++ zsh git-gui docker docker-compose wireshark htop"
rhel_atom="https://github.com/atom/atom/releases/download/v1.5.3/atom.x86_64.rpm"
rhel_dropbox="https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm"
rhel_erlang="https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_18.2-1~centos~7_amd64.rpm"

# Commands
alias dnf_install='sudo dnf install -y '

if python -mplatform | grep -q -i ubuntu; then
  sudo apt update -y
  sudo apt install -y $deb_packages
  wget $deb_atom -O atom.deb
  wget $deb_dropbox -O dropbox.deb
  sudo dpkg -i atom.deb
  sudo dpkg -i dropbox.deb
  sudo apt install -f
elif python -mplatform | grep -q -i fedora; then
  # Install RPM fusion
  dnf_install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  dnf_install $rhel_packages
  dnf_install $rhel_atom
  dnf_install $rhel_dropbox
  dnf_install $rhel_erlang
elif python -mplatform | grep -q -i opensuse; then
  sudo zypper in -y $rhel_packages $rhel_atom $rhel_dropbox $rhel_erlang
else
  echo "Your Linux distribution is not supported"
fi


# Install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 4 && nvm install 5
nvm alias default 4

# Install Atom Text Editor packages
apm install sync-settings editorconfig linter linter-eslint atom-beautify ensime

# ============================
# Create additional folders  in ~/

mkdir $HOME/bin
mkdir $HOME/code
mkdir $HOME/github
mkdir $HOME/share
mkdir $HOME/tmp

# ============================
# Setup applications in ~/share

pushd $HOME/share

# Install Elixir
git clone $generic_elixir && cd elixir && git checkout v1.2.3 && sudo make install

# Firefox Developer Edition
curl -o firefox.tar.bz2 "https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora/firefox-47.0a2.en-US.linux-x86_64.tar.bz2"
tar -jxvf firefox.tar.bz2

# neofetch
git clone git@github.com:dylanaraps/neofetch.git

# youtube-open
git clone git@github.com:hekar/youtube-open.git

# Powerline fonts
git clone git@github.com:powerline/fonts.git
pushd fonts
./install.sh
popd

popd # $HOME/share

# Install dotfiles
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
git clone git@github.com:hekar/vim-n-home.git &&
cp -R ./dotfiles/. ~/ &&
mv ~/.git ~/.homegit &&
rm -Rf ./dotfiles
