# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hutch"

# Example aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias reload="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew nyan)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

DEFAULTPATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
PERLPATH="/usr/bin/vendor_perl:/usr/bin/core_perl"
TEXPATH="/usr/texbin"
HOMEBIN="$HOME/bin"
MYPYTHONPATH="$HOME/.local/bin:/usr/local/share/python"
COREUTILSPATH="/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$COREUTILSPATH:$DEFAULTPATH:$HOMEBIN:$PERLPATH:$TEXPATH:$MYPYTHONPATH"
export PYTHONPATH="$HOME/Library/Python/2.7/site-packages:/usr/local/lib/python2.7/site-packages"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# virtualenvwrapper stuff:
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENV_PYTHON=$VIRTUALENVWRAPPER_PYTHON
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/lemnos
source $(which virtualenvwrapper.sh)

eval $(dircolors $HOME/.dircolors)

alias ls='ls --color=auto'
alias la='ls -AF'

alias bc='bc -l'

export EDITOR=vim
alias e=$EDITOR
export PAGER=less

function man-preview() {
  man -t "$@" | open -f -a Preview
}

function learn_spam () {
  ssh uber 'for f in ~/users/martin/.Spam/cur/*; do spamc -L spam -U ~/tmp/spamd.sock < $f; done'
}
