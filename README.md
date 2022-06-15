# Personal Configs

Clone anywhere.

## Configuring
### Util
```bash
sudo apt-get install jq silversearcher-ag exuberant-ctags autojump git
```

### Git
- install `diff-so-fancy`
  - `curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o ~/scripts/diff-so-fancy`
  - `sudo chmod +x ~/scripts/diff-so-fancy`
- `ln -s $PWD/git/.gitconfig $HOME/.gitconfig`
  - edit "user" section accordingly
- `ln -s $PWD/git/.gitignore_global $HOME/.gitignore_global`
  - make sure `git config --global core.excludesfile $HOME/.gitignore_global` is set correctly ($HOME expanded)

### Tmux
```bash
sudo apt install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s $PWD/shell/.tmux.conf $HOME/.tmux.conf

# C-b I inside session to install plugins
```

### Neovim
- install [Neovim](https://neovim.io/)
- `vim-plug` should be automatically installed when opening `nvim`. See [Here](https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation)``
- open `nvim` and run `:PlugInstall`
- install Coc language servers: `:CocInstall coc-json coc-tsserver coc-html coc-css`

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
