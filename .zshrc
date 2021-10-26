. $HOME/.profile
export TERM=xterm-256color
export LANG=en_US.UTF-8
export GOPATH=$HOME/github/go

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="lambda"

DEFAULT_USER=$USERNAME

export UPDATE_ZSH_DAYS=30

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

base_plugins=(asdf adb common-aliases systemd urltools web-search docker docker-compose dirhistory rsync)

# User configuration

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:$PATH"

export EDITOR=vim

export DOCKER=docker
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

# Strace
alias st-forked='strace -ff -o trace/out -f --'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hekar/google-cloud-sdk/path.zsh.inc' ]; then source '/home/hekar/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hekar/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/hekar/google-cloud-sdk/completion.zsh.inc'; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"

# Enable ASDF
export PATH="$PATH:$HOME/.asdf/bin"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
