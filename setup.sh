#!/bin/bash

generic_elixir="https://github.com/elixir-lang/elixir.git"

deb_packages="i3 git git-gui vim g++ zsh docker docker-compose htop golang byzanz clang i3lock curl stow"
deb_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

rhel_packages="i3 git vim gcc-c++ zsh git-gui docker docker-compose wireshark htop ImageMagick-devel byzanz glew-devel cmake golang clang i3lock libgit2-devel stow"
rhel_chrome="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

suse_packages="git vim gcc-c++ zsh git-gui docker docker-compose wireshark htop cmake stow make gnome-tweak-tool gnome-pomodoro go go-doc libgit2-devel automake"

shopt -s expand_aliases
alias dnf_install='sudo dnf install -y'
alias zyp_in='sudo zypper install -y'
if python -mplatform | grep -q -i ubuntu; then
  sudo apt update -y
  sudo apt install -y $deb_packages
  wget $deb_chrome -O chrome.deb
  sudo dpkg -i chrome.deb
  sudo apt install -f
elif python3 -mplatform | grep -q -i fedora; then
  # Install RPM fusion
  dnf_install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  dnf_install $rhel_packages
  dnf_install $rhel_erlang
  dnf_install $rhel_chrome
  sudo dnf remove -y java-1.8.0-openjdk-headless.x86_64
  dnf_install libtool libtool-ltdl-devel libvterm-devel
else
  echo -e "\e[33m Your Linux distribution is not supported"
  echo -e "\e[33m Assuming you are running OpenSUSE or OpenSUSE Tumbleweed"
  wget https://dl.google.com/linux/linux_signing_key.pub
  sudo rpm --import linux_signing_key.pub
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
	sudo zypper refresh
	sudo zypper install -y code
	zyp_in "https://atom-installer.github.com/v1.18.0/atom.x86_64.rpm?s=1497483731&ext=.rpm"
  zyp_in $suse_packages
  zyp_in $rhel_erlang
  zyp_in $rhel_chrome
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
mkdir -p $HOME/github/go/src/github.com/hekar
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

pushd $HOME/github/go/src/github.com/hekar

git clone git@github.com:hekar/codetalks.git
git clone git@github.com:hekar/gitmark.git

popd # $HOME/github/go/src/github.com/hekar

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
rm ~/.bashrc ~/.config/user-dirs.dirs ~/.config/user-dirs.locale ~/.profile &&
cd ./dotfiles &&
stow .

