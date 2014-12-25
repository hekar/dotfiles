if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export VAGRANT_RSYNC=true

# User configuration
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

[[ -s "/home/hekar/.gvm/scripts/gvm" ]] && source "/home/hekar/.gvm/scripts/gvm"

