# Personal Configs

Clone anywhere.

## Configuring
### Git
- install `diff-so-fancy`
  - `curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o ~/scripts/diff-so-fancy`
  - `sudo chmod +x ~/scripts/diff-so-fancy`
- `ln -s $PWD/git/.gitconfig $HOME/.gitconfig`
  - edit "user" section accordingly
- `ln -s $PWD/git/.gitignore_global $HOME/.gitignore_global`
  - make sure `git config --global core.excludesfile $HOME/.gitignore_global` is set correctly

### Tmux
```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $PWD/shell/.tmux.conf $HOME/.tmux.conf

# C-b I inside session to install plugins
```

### Neovim
- install [Neovim](https://neovim.io/)
- install [Vundle](https://github.com/VundleVim/Vundle.vim.git)
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
ln -s $PWD/nvim $HOME/.config/nvim
```
- open `nvim` and run `:BundleInstall`, then `:UpdateRemotePlugins`

### FZF
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Shell
```
ln -s $PWD/shell/.zshrc $HOME/.zshrc
ln -s $PWD/shell/.oh-my-zsh $HOME/.oh-my-zsh
ln -s $PWD/shell/.agignore $HOME/.agignore
```
- install Terminator terminal
  - `ln -s $PWD/shell/terminator $HOME/.config/terminator`
