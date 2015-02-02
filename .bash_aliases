#!/bin/bash

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# User configuration
export LANGUAGE=en
export ANDROID_SDK=/home/hekar/Android/Sdk
export ANDROID_HOME=$ANDROID_SDK
export PATH=$ANDROID_SDK:$PATH
export PATH=$ANDROID_SDK/tools:$PATH
export PATH=$ANDROID_SDK/platform-tools:$PATH

export JAVA_HOME=/home/hekar/share/jdk
export JDK_HOME=$JAVA_HOME
export STUDIO_JDK=$JAVA_HOME
export PATH=$JAVA_HOME:$PATH

export CROSSWALK=/home/hekar/share/crosswalk
export PATH=$CROSSWALK:$PATH

alias sd='sudo docker.io'
alias sdps='sudo docker.io ps -a'
alias sdi='sudo docker.io images'
alias sdr='sudo docker.io run'
alias hgit='git --git-dir=$HOME/.homegit --work-tree=$HOME'

