#!/bin/bash

generic_elixir="https://github.com/elixir-lang/elixir.git"

deb_packages="i3 git git-gui vim g++ zsh docker docker-compose htop"
deb_atom="https://github.com/atom/atom/releases/download/v1.12.6/atom-amd64.deb"
deb_dropbox="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
deb_erlang="https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.0.2-1~ubuntu~xenial_amd64.deb"
deb_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

rhel_packages="i3 git vim gcc-c++ zsh git-gui docker docker-compose wireshark htop ImageMagick-devel byzanz glew-devel cmake"
rhel_atom="https://github.com/atom/atom/releases/download/v1.12.6/atom.x86_64.rpm"
rhel_dropbox="https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm"
rhel_erlang="https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.0~centos~7_amd64.rpm"
rhel_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
rhel_jdk="http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.rpm"


suse_packages="i3 git vim gcc-c++ zsh git-gui docker docker-compose wireshark htop"

shopt -s expand_aliases
alias dnf_install='sudo dnf install -y'
alias zyp_in='sudo zypper install -y'
if python -mplatform | grep -q -i ubuntu; then
  sudo apt update -y
  sudo apt install -y $deb_packages
  wget $deb_atom -O atom.deb
  wget $deb_dropbox -O dropbox.deb
  wget $deb_erlang -O erlang.deb
  wget $deb_chrome -O chrome.deb
  sudo dpkg -i atom.deb
  sudo dpkg -i dropbox.deb
  sudo dpkg -i erlang.deb
  sudo dpkg -i chrome.deb
  sudo apt install -f
elif python3 -mplatform | grep -q -i fedora; then
  # Install RPM fusion
  dnf_install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  dnf_install $rhel_packages
  dnf_install $rhel_atom
  dnf_install $rhel_dropbox
  dnf_install $rhel_erlang
  dnf_install $rhel_chrome
  dnf_install $rhel_jdk
  sudo dnf remove -y java-1.8.0-openjdk-headless.x86_64
  dnf_install libtool libtool-ltdl-devel libvterm-devel
elif python -mplatform | grep -q -i opensuse; then
  zyp_in $suse_packages
  zyp_in $rhel_atom
  zyp_in $rhel_dropbox
  zyp_in $rhel_erlang
  zyp_in $rhel_chrome
else
  echo "Your Linux distribution is not supported"
fi


# Install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 4 && nvm install 6
nvm alias default 6

# Install Atom Text Editor packages
apm install editorconfig linter linter-eslint atom-beautify

# ============================
# Create additional folders  in ~/

mkdir $HOME/bin
mkdir $HOME/code
mkdir $HOME/github
mkdir $HOME/share
mkdir $HOME/tmp
mkdir $HOME/.vim_backup
rm -Rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

# ============================
# Setup applications in ~/share

pushd $HOME/share

# Install Elixir
git clone $generic_elixir && cd elixir && git checkout v1.3.4 && sudo make install

# Neovim
git clone https://github.com/neovim/neovim.git
pushd neovim
make
sudo make install
popd

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
git clone git@github.com:hekar/dotfiles.git &&
cp -R ./dotfiles/. ~/ &&
mv ~/.git ~/.homegit &&
rm -Rf ./dotfiles

