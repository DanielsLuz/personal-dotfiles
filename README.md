# Personal Configs

Clone anywhere.

## Configuring
### Neovim
- install Neovim
- `ln -s $PWD/nvim $HOME/.config/nvim`
- open `nvim` and run `:BundleInstall`, then `:UpdateRemotePlugins`

### Git
- install `diff-so-fancy`
  - `curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o ~/scripts/diff-so-fancy`
  - `sudo chmod +x ~/scripts/diff-so-fancy`
- `ln -s $PWD/git/.gitconfig $HOME/.gitconfig`
  - edit "user" section accordingly
- `ln -s $PWD/git/.gitignore_global $HOME/.gitignore_global`
  - make sure `git config core.excludesfile $HOME/.gitignore_global` is set correctly

### ZSH
- `ln -s $PWD/shell/.zshrc $HOME/.zshrc`
- `ln -s $PWD/shell/.oh-my-zsh $HOME/.oh-my-zsh`
- `ln -s $PWD/shell/.agignore $HOME/.agignore`
