export EDITOR=/usr/bin/vim
test -s ~/.alias && . ~/.alias || true

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/hekar/.nvm/versions/node/v8.9.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/hekar/.nvm/versions/node/v8.9.2/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/hekar/.nvm/versions/node/v8.9.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/hekar/.nvm/versions/node/v8.9.2/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
