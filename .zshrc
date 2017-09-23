. $HOME/.profile
export TERM=xterm-256color
export LANG=en_US.UTF-8
export GOPATH=$HOME/github/go

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="af-magic"

DEFAULT_USER=$USERNAME

export UPDATE_ZSH_DAYS=30

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

base_plugins=(adb common-aliases systemd urltools vagrant web-search nyan docker docker-compose dirhistory rsync)

# User configuration

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:$PATH"
export PATH="$PATH:$HOME/github/go/bin"

export EDITOR=vim

export DOCKER=docker
# This is for OpenSUSE only
add_plugins=(zypper)
plugins=( "${base_plugins[@]}" "${add_plugins[@]}" )

source $ZSH/oh-my-zsh.sh

# Android
export LANGUAGE=en
export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK
export PATH=$ANDROID_SDK:$PATH
export PATH=$ANDROID_SDK/tools:$PATH
export PATH=$ANDROID_SDK/platform-tools:$PATH

# Docker
alias sd='sudo $DOCKER'
alias sd-ps='sudo $DOCKER ps -a'
alias sd-inspect='sudo $DOCKER inspect'
alias sd-images='sudo $DOCKER images'
alias sd-run='sudo $DOCKER run'
alias sd-build='sudo $DOCKER build'
alias sd-restart='sudo $DOCKER restart'
alias sd-kill-all='sudo $DOCKER kill $(sudo $DOCKER ps -q) && docker rm -f $(sudo $DOCKER ps -a -q)'
alias sd-remove-all='sudo $DOCKER rmi -f $(sudo $DOCKER images -q)'

# Docker Compose
export DOCKER_COMPOSE=docker-compose
alias sdc-rup='sudo $DOCKER_COMPOSE rm -f && sudo $DOCKER_COMPOSE up'
alias sdc-build='sudo $DOCKER_COMPOSE build'
alias sdc-up='sudo $DOCKER_COMPOSE up'
alias sdc-stop='sudo $DOCKER_COMPOSE stop'
alias sdc-restart='sudo $DOCKER_COMPOSE stop'
alias sdc-kill='sudo $DOCKER_COMPOSE stop'
alias sdc-build='sudo $DOCKER_COMPOSE build'
alias sdc-kill='sudo $DOCKER_COMPOSE kill'
alias sdc-logs='sudo $DOCKER_COMPOSE logs'
alias sdc-port='sudo $DOCKER_COMPOSE port'
alias sdc-ps='sudo $DOCKER_COMPOSE ps'
alias sdc-pull='sudo $DOCKER_COMPOSE pull'
alias sdc-restart='sudo $DOCKER_COMPOSE restart'
alias sdc-rm='sudo $DOCKER_COMPOSE rm'
alias sdc-run='sudo $DOCKER_COMPOSE run'
alias sdc-scale='sudo $DOCKER_COMPOSE scale'
alias sdc-start='sudo $DOCKER_COMPOSE start'
alias sdc-stop='sudo $DOCKER_COMPOSE stop'
alias sdc-up='sudo $DOCKER_COMPOSE up'
alias sdc-version='sudo $DOCKER_COMPOSE version'
alias sdc-rbup='sdc-rm -f && sdc-build && sdc-up'

# Elixir
alias ca="cd $HOME/Dropbox/ca"
alias ca-lib="cd $HOME/Dropbox/ca/lib/"
alias ca-web="cd $HOME/Dropbox/ca/web/"

# Git
alias gp='git pull'
alias gr='git rebase -i'
alias gpu='git push'
alias git-log-latest='git log --graph --all --format=format:"%h - (%ai) %s -- %cn %d" --abbrev-commit --date=relative -10'

#IPTables
alias ipt='sudo /sbin/iptables'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# Power states
alias sc-suspend-nolock='sudo systemctl suspend'
alias sc-suspend='i3lock -c 000000 && sc-suspend-nolock'
alias sc-halt='sudo systemctl poweroff'
alias sc-reboot='sudo systemctl reboot'

# Sec
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias rm='rm -I --preserve-root'

# Misc
alias hgit='git --git-dir=$HOME/.homegit --work-tree=$HOME'
alias grn='grep -nir'
alias df='df -h'
alias usage='du -d 1 -h'
alias ctalk='cd ~/github/go/src/github.com/hekar/codetalks'

# Strace
alias st-forked='strace -ff -o trace/out -f --'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

PATH="/home/hekar/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/hekar/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/hekar/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/hekar/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/hekar/perl5"; export PERL_MM_OPT;
