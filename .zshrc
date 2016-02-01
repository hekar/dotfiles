# Path to your oh-my-zsh installation.
export ZSH=/home/hekar/.oh-my-zsh

ZSH_THEME="agnoster"

export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git adb common-aliases systemd urltools vagrant web-search nyan docker dirhistory rsync)

# User configuration

export PATH="/home/hekar/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11"

source $ZSH/oh-my-zsh.sh

export EDITOR=vim

# Android
export LANGUAGE=en
export ANDROID_SDK=/home/hekar/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK
export PATH=$ANDROID_SDK:$PATH
export PATH=$ANDROID_SDK/tools:$PATH
export PATH=$ANDROID_SDK/platform-tools:$PATH

# DNF
alias di='sudo dnf install -y'
alias ds='sudo dnf search'

# Docker
export DOCKER=docker
alias sd='sudo $DOCKER'
alias sdps='sudo $DOCKER ps'
alias sdpsa='sudo $DOCKER ps -a'
alias sdi='sudo $DOCKER images'
alias sdr='sudo $DOCKER run'
alias sdb='sudo $DOCKER build'
alias sddpsa='sudo $DOCKER kill -f $(sudo $DOCKER ps -q) && docker rm -f $(sudo $DOCKER ps -a -q)'
alias sddid='sudo $DOCKER rmi $(sudo $DOCKER images -q -f dangling=true)'

# Docker Compose
export DOCKER_COMPOSE=docker-compose
alias sdc-build='sudo $DOCKER_COMPOSE build'
alias sdc-up='sudo $DOCKER_COMPOSE --enable-networking up'
alias sdc-stop='sudo $DOCKER_COMPOSE stop'
alias sdc-restart='sudo $DOCKER_COMPOSE stop'
alias sdc-kill='sudo $DOCKER_COMPOSE stop'

# Elixir
alias cs="cd /home/hekar/Dropbox/phoenix/installer/cs"
export PATH=$PATH:/home/hekar/share/elixir/bin

# Git
alias gp='git pull'
alias gr='git rebase -i'
alias gpu='git push'

# Java
export JAVA_HOME=$HOME/share/jdk
export JDK_HOME=$JAVA_HOME
export STUDIO_JDK=$JAVA_HOME
export PATH=$JAVA_HOME:$PATH

# Misc
alias hgit='git --git-dir=$HOME/.homegit --work-tree=$HOME'
alias grn='grep -nir'
alias media='cd /media/share/complete'
alias df='df -h'
alias usage='du -d 1 -h'

export NVM_DIR="/home/hekar/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

