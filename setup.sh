#!/usr/bin/bash

set -ev

sudo apt-get install -y jq silversearcher-ag exuberant-ctags autojump tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

ln -s $PWD/git/.gitconfig $HOME/.gitconfig
ln -s $PWD/git/.gitignore_global $HOME/.gitignore_global
ln -s $PWD/shell/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/shell/.zshrc $HOME/.zshrc
ln -s $PWD/shell/.oh-my-zsh $HOME/.oh-my-zsh
ln -s $PWD/shell/.agignore $HOME/.agignore
