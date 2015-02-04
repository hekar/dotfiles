[[ -s "/home/hekar/.gvm/scripts/gvm" ]] && source "/home/hekar/.gvm/scripts/gvm"

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
