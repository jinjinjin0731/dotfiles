#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing homebrew packages..."

# use Tsinghua mirror to speed up the process
# homebrew-core
cd "$(brew --repo)"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
# homebrew-bottles
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles' >> $HOME/.bash_profile
source $HOME/.bash_profile

# cli tools
brew reinstall ack
brew reinstall tree
brew reinstall wget

# development server setup
brew reinstall nginx

# development tools
brew reinstall git
brew reinstall autojump
brew reinstall reattach-to-user-namespace
brew reinstall tmux
brew reinstall zsh
brew reinstall highlight
# brew reinstall macvim --with-override-system-vim
