# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hutch"
eval $(dircolors -b $HOME/.dircolors)

unsetopt BEEP

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

# Zeilen mit einem # am Anfang werden als Kommentare interpretiert:
INTERACTIVE_COMMENTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vagrant debian django)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

DEFAULTPATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
PERLPATH="/usr/bin/vendor_perl:/usr/bin/core_perl"
RUBYPATH="$HOME/.gem/ruby/1.9.1/bin"
HASKELLPATH="$HOME/.cabal/bin"
TEXPATH="/usr/texbin"
MYPYTHONPATH="$HOME/.local/bin"
GAMESPATH="/usr/local/games"
export PATH="$DEFAULTPATH:$PERLPATH:$RUBYPATH:$TEXPATH:$MYPYTHONPATH:$HASKELLPATH"
export PYTHONPATH="/usr/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
if [ -d "$HOME/.auswertung" ]; then
    export PATH="$PATH:$HOME/.auswertung"
fi

export PYTHONIOENCODING=UTF-8

# virtualenvwrapper stuff:
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENV_PYTHON=$VIRTUALENVWRAPPER_PYTHON
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/lemnos
source $HOME/.local/bin/virtualenvwrapper.sh

alias la='ls -AF'
alias open='xdg-open'

export EDITOR=vim
alias e=$EDITOR
alias se="sudoedit"
if which vimpager >/dev/null 2>&1; then
    export PAGER="vimpager"
else
    export PAGER="less"
fi

if [ "$COLORTERM" = "gnome-terminal" ]; then
    export TERM="xterm-256color"
fi

alias dimmer='redshift -l 54:12 -t 5700:3600 -m randr 2> /dev/null &'

# connect via xfreerdp to uniapps.uni-rostock.de
alias uniapps='xfreerdp --sec tls -d uni-rostock.de -u md261 -x b -g 95% uniapps.uni-rostock.de'

function learn_spam () {
    ssh uber 'for f in ~/users/martin/.Spam/cur/*; do spamc -L spam -U ~/tmp/spamd.sock < $f; done'
}
