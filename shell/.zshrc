# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="zhann"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
setopt   HIST_REDUCE_BLANKS HIST_SAVE_NO_DUPS
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails bundler autojump docker-compose tmux)

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

source $ZSH/oh-my-zsh.sh
source /usr/share/autojump/autojump.sh
export LD_LIBRARY_PATH=$HOME/openssl/lib
export LC_ALL="en_US.UTF-8"
export LDFLAGS="-L /home/danielluz/openssl/lib -Wl,-rpath,/home/danielluz/openssl/lib"

alias gst="git status --short"
alias clip="xsel --clipboard -i"
alias merge-pdf="gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf"

# User configuration
TODO_FILE=.todo
function showTodoFile() {
  if [[ -s "$TODO_FILE" ]]; then
    echo "Current TODO list:"
    cat -n $TODO_FILE 2>/dev/null
  fi
}

function chpwd() {
  if [[ -s "$TODO_FILE" ]]; then
    showTodoFile
  fi
}

# add todo <task>
function todo() {
  if [ $# -eq 0 ]; then
    showTodoFile
    return 0
  fi

  readonly task=${1:?"Specify a task"}

  echo "$task">>$TODO_FILE

  showTodoFile
}

# complete todo <task number>
function todone() {
  readonly taskNumber=${1:?"Specify a task number"}

  echo "DONE"
  sed "${taskNumber}q;d" $TODO_FILE
  sed -i "${taskNumber}d" $TODO_FILE

  showTodoFile
}
alias don=todone

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

function gsu(){
  branch_name="$(git branch | awk '/^\* / { print $2 }')"
  git branch --set-upstream-to origin/${branch_name} ${branch_name}
}
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias r="bundle exec rspec"
alias ro="bundle exec rspec --only-failures"

export PATH=$HOME/openssl/bin:$PATH
export PATH=$HOME/programs:$PATH
export PATH=$HOME/programs/node-v14.17.5-linux-x64/bin:$PATH
export PATH=$HOME/scripts:$PATH
export PATH=$HOME/neovim/bin:$PATH
export PATH=$HOME/n/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=/snap/bin:$PATH

alias nfzf="nvim \$(fzf)"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
