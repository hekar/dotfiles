# Elixir
export PATH=$HOME/share/elixir/bin:$PATH

# Firefox
export PATH=$HOME/share/firefox/:$PATH

# Java
export JAVA_HOME=$HOME/share/jdk
export JDK_HOME=$JAVA_HOME
export STUDIO_JDK=$JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH

# Gatling
export GATLING_HOME=$HOME/share/gatling
export PATH=$GATLING_HOME/bin:$PATH

if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

XDG_CURRENT_DESKTOP=KDE

TZ='America/Toronto'; export TZ

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
