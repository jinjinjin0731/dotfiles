DOTFILES=$HOME/dotfiles
export ZSH=$HOME/.oh-my-zsh

# Plugins

## Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

## Oh-my-zsh
## Other available options: sublime / atom / ruby
plugins=(git osx autojump brew history dirhistory nvm-auto-switch zsh-better-npm-completion zsh-autosuggestions)


# Mirrors

## Electron
export ELECTRON_MIRROR=https://npm.taobao.org/mirrors/electron/

# Theme: Bullet Train
## https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
ZSH_THEME="bullet-train"
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

source $ZSH/oh-my-zsh.sh
