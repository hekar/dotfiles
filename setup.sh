#!/bin/bash

chrome_package="https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm"

suse_packages="git vim gcc-c++ zsh git-gui docker wireshark htop cmake stow make go go-doc libgit2-devel automake i3 i3lock i3status tmux rxvt-unicode urxvt-font-size libtool emacs xclip"

shopt -s expand_aliases
alias zyp_in='sudo zypper install -y'
echo -e "\e[33m Assuming you are running OpenSUSE or OpenSUSE Tumbleweed"
wget https://dl.google.com/linux/linux_signing_key.pub
sudo rpm --import linux_signing_key.pub
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
sudo zypper refresh
sudo zypper install -y code
zyp_in $suse_packages
zyp_in $chrome_package

# Install Spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Install node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 6 && nvm install 8
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

# Install codecs
zypper addrepo -f http://packman.inode.at/suse/openSUSE_Tumbleweed/ packman
zypper addrepo -f http://packman.inode.at/suse/openSUSE_Tumbleweed/ packman
zypper install ffmpeg lame gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer-plugins-ugly-orig-addon gstreamer-plugins-libav libdvdcss2
zypper dup --from http://packman.inode.at/suse/openSUSE_Tumbleweed/

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
curl https://glide.sh/get | sh

# Install dotfiles
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
git clone git@github.com:hekar/dotfiles.git &&
rm ~/.bashrc ~/.config/user-dirs.dirs ~/.config/user-dirs.locale ~/.profile &&
cd ./dotfiles &&
stow .

