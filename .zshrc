export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git yarn z volta dotenv kubectl kubectx archlinux pm2 command-not-found)

source $ZSH/oh-my-zsh.sh

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/esp/xtensa-lx106-elf/bin:$PATH"
export IDF_PATH="$HOME/esp/ESP8266_RTOS_SDK"

export CUDA_VISIBLE_DEVICES="-1"
eval "$(starship init zsh)"

#eval $(opam env --switch=default)
