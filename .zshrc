# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hutch"

# Example aliases
alias zshconfig="vim ~/.zshrc"
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
plugins=(git archlinux taskwarrior)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

DEFAULTPATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
PERLPATH="/usr/bin/vendor_perl:/usr/bin/core_perl"
RUBYPATH="$HOME/.gem/ruby/1.9.1/bin"
TEXPATH="/usr/texbin"
MYPYTHONPATH="$HOME/.local/bin"
MEDAUSWERTUNGPATH=":$HOME/.auswertung"
export PATH="$DEFAULTPATH:$PERLPATH:$RUBYPATH:$TEXPATH:$MYPYTHONPATH:$MEDAUSWERTUNGPATH"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

alias la='ls -AF'

export EDITOR=vim
alias e=$EDITOR
alias se="sudoedit"
export PAGER="less"

alias a='ack'
alias aa='ack -a'

if [ "$COLORTERM" = "gnome-terminal" ]; then
    export TERM="xterm-256color"
fi

alias uniapps='xfreerdp --sec tls -d uni-rostock.de -u aw089 -x b -g 95% uniapps.uni-rostock.de'

# generate new passwords:
alias neuespw='pwgen -B 12 1'

alias open="xdg-open"
alias bc="bc -l"

function ev {
    evince $1 &
}
