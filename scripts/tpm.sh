#!/bin/bash

## Install Tmux Plugin Manager
tpm_dir=$HOME/.tmux/plugins/tpm
if [ ! -d $tpm_dir ]; then
    echo "Installing Tmux Plugin Manager"
    mkdir -p $tpm_dir
    git clone https://github.com/tmux-plugins/tpm $tpm_dir
fi
