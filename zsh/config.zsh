DOTFILES=$HOME/dotfiles
export ZSH=$HOME/.oh-my-zsh

### Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

## Oh-my-zsh Plugins
plugins=(git osx autojump ruby sublime brew history atom dirhistory nvm-auto zsh-autosuggestions)

# Bullet Train
# https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
ZSH_THEME="bullet-train" # "agnoster"
export BULLETTRAIN_DIR_FG=black
export BULLETTRAIN_DIR_EXTENDED=2
export BULLETTRAIN_GIT_COLORIZE_DIRTY=true
export BULLETTRAIN_GIT_COLORIZE_DIRTY_COLOR=yellow
export BULLETTRAIN_GIT_BG=green
export BULLETTRAIN_GIT_EXTENDED=false
export BULLETTRAIN_EXEC_TIME_SHOW=true
export BULLETTRAIN_EXEC_TIME_ELAPSED=1
export BULLETTRAIN_EXEC_TIME_BG=cyan
export BULLETTRAIN_TIME_BG=black
export BULLETTRAIN_TIME_FG=black
export BULLETTRAIN_NVM_SHOW=true
export BULLETTRAIN_VIRTUALENV_SHOW=false

source $HOME/.oh-my-zsh/oh-my-zsh.sh
