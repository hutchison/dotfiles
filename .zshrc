# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="hutch"

# Bitte nicht piepen. Das nervt:
unsetopt BEEP

# Example aliases
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
plugins=(git nyan django systemadmin gpg-agent pip)
if [[ $OSTYPE == "darwin"* ]]; then
    plugins=("${plugins[@]}" brew)
elif [[ $OSTYPE == "linux-gnu" ]]; then
    plugins=("${plugins[@]}" debian)
else
    >&2 echo "Kein Mac oder Linux. Wo bin ich?"
fi

source $ZSH/oh-my-zsh.sh

# Pfade:
DEFAULTPATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
if [[ -d "$HOME/.gem/ruby/1.9.1/bin" ]]; then
    RUBYBINPATH="$HOME/.gem/ruby/1.9.1/bin"
fi
if [[ -d "$HOME/.local/bin" ]]; then
    HOMEBINPATH="$HOME/.local/bin"
fi
if [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
    HOMEBREWGNUBINPATH="/usr/local/opt/coreutils/libexec/gnubin"
fi
export PATH="$HOMEBREWGNUBINPATH:$DEFAULTPATH:$HOMEBINPATH:$RUBYBINPATH"

# Python stuff:
export PYTHONIOENCODING=UTF-8

# virtualenvwrapper stuff:
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENV_PYTHON=$VIRTUALENVWRAPPER_PYTHON
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/lemnos
if [[ -x $(which virtualenvwrapper.sh) ]]; then
    source $(which virtualenvwrapper.sh)
else
    >&2 echo "virtualenvwrapper.sh nicht vorhanden"
fi

# Lade meine dircolors, sofern vorhanden:
if [[ -f $HOME/.dircolors ]]; then
    eval $(dircolors -b $HOME/.dircolors)
else
    >&2 echo "$HOME/.dircolors nicht vorhanden"
fi

# Aliase und Funktionen:
alias ls="ls --color=auto"
alias la="ls -AF"

alias bc='bc -l'

if [[ -d "$HOME/Downloads/" ]]; then
    alias mutt='cd "$HOME/Downloads" && mutt'
fi

if [[ -x $(which xdg-open) ]]; then
    alias open='xdg-open'
fi

# generate new passwords:
if [[ -x $(which pwgen) ]]; then
    alias neuespw='pwgen -B 12 1'
fi

if [[ -x $(which t) ]]; then
    alias tt='t d -s "30 days ago"'
fi

# um php in der Shell benutzen zu können:
if [[ -f /etc/profile.d/phpversion.sh ]]; then
    source /etc/profile.d/phpversion.sh
fi

if [[ -f "$HOME/bin/composer.phar" ]]; then
    alias composer='php ~/bin/composer.phar'

if [[ -x $(which timetrap) ]]; then
    alias tt='timetrap d -s "30 days ago"'
fi

export EDITOR=vim
alias e=$EDITOR
alias se="sudoedit"
export PAGER="less"

if [[ "$COLORTERM" == "gnome-terminal" ]]; then
    export TERM="xterm-256color"
fi

# connect via xfreerdp to uniapps.uni-rostock.de
if [[ -x $(which xfreerdp) ]]; then
    function uniapps () {
        xfreerdp --sec tls -d uni-rostock.de -u "$1" -x b -g 95% uniapps.uni-rostock.de
    }
fi

function learn_spam () {
    ssh uber 'for f in ~/users/martin/.Spam/cur/*; do echo -n "$(spamc -L spam -U ~/tmp/spamd.sock < $f) "; grep -h ^Subject: $f; done'
}

function learn_ham () {
    ssh uber 'for f in ~/users/martin/.Archive/cur/*; do echo -n "$(spamc -L ham -U ~/tmp/spamd.sock < $f) "; grep -h ^Subject: $f; done'
}
