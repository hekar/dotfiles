#!/bin/bash

generic_elixir="https://github.com/elixir-lang/elixir.git"

deb_packages="i3 git git-gui vim g++ zsh docker docker-compose htop golang byzanz clang i3lock curl"
deb_dropbox="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb"
deb_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

rhel_packages="i3 git vim gcc-c++ zsh git-gui docker docker-compose wireshark htop ImageMagick-devel byzanz glew-devel cmake golang clang i3lock libgit2-devel"
rhel_dropbox="https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm"
rhel_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"
rhel_jdk="http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.rpm"


suse_packages="git vim gcc-c++ zsh git-gui docker docker-compose wireshark htop cmake"

shopt -s expand_aliases
alias dnf_install='sudo dnf install -y'
alias zyp_in='sudo zypper install -y'
if python -mplatform | grep -q -i ubuntu; then
  sudo apt update -y
  sudo apt install -y $deb_packages
  wget $deb_dropbox -O dropbox.deb
  wget $deb_chrome -O chrome.deb
  sudo dpkg -i dropbox.deb
  sudo dpkg -i chrome.deb
  sudo apt install -f
elif python3 -mplatform | grep -q -i fedora; then
  # Install RPM fusion
  dnf_install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  dnf_install $rhel_packages
  dnf_install $rhel_dropbox
  dnf_install $rhel_erlang
  dnf_install $rhel_chrome
  dnf_install $rhel_jdk
  sudo dnf remove -y java-1.8.0-openjdk-headless.x86_64
  dnf_install libtool libtool-ltdl-devel libvterm-devel
elif python -mplatform | grep -q -i opensuse; then
  zyp_in $suse_packages
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

# ============================
# Create additional folders  in ~/

mkdir $HOME/bin
mkdir $HOME/code
mkdir $HOME/github
mkdir $HOME/github/go
mkdir $HOME/share
mkdir $HOME/tmp
mkdir $HOME/.vim_backup
rm -Rf $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos

# ============================
# Setup applications in ~/share

pushd $HOME/share

# Neovim
git clone https://github.com/neovim/neovim.git
pushd neovim
make
sudo make install
sudo pip3 install --upgrade pip && pip3 install --user neovim
popd

# youtube-open
git clone git@github.com:hekar/youtube-open.git

popd # $HOME/share

# Golang dependencies
go get -u github.com/constabulary/gb/...
go get -u github.com/nsf/gocode
go get -u github.com/libgit2/git2go
go get -u github.com/zenazn/goji
go get -u github.com/davecgh/go-spew/spew
go get -u github.com/spf13/viper
go get -u github.com/google/go-github/github
go get -u github.com/garyburd/redigo/redis
go get -u github.com/Rafflecopter/golang-relyq/relyq
go get -u github.com/Rafflecopter/golang-relyq/storage/redis
go get -u github.com/bradfitz/gomemcache/memcache

# Install dotfiles
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
git clone git@github.com:hekar/dotfiles.git &&
cp -R ./dotfiles/. ~/ &&
mv ~/.git ~/.homegit &&
rm -Rf ./dotfiles

