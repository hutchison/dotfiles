export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000
export PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;34m\]\h \[\e[0m\]\t \w$(__git_ps1 " (%s)") $(randompromptsymbol) '
export LC_ALL="de_DE.UTF-8"
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin"
LOCALBIN="~/.local/bin"
TEXBIN="/usr/local/texlive/2011/bin/x86_64-linux/:/usr/local/texlive/2011/bin/x86_64-darwin/"
PERLBIN="/usr/bin/vendor_perl/"
export PATH="$PATH:$LOCALBIN:$TEXBIN:$PERLBIN"
# go files:
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin

# Completion:
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
source ~/dotfiles/git-completion.bash
# zeigt an, ob in einem git-repo was geändert wurde:
# '*' für unstaged
# '+' für staged
GIT_PS1_SHOWDIRTYSTATE=1

# Farben auf dem Terminal
export CLICOLOR=1
if [ "$COLORTERM" = "gnome-terminal" ]; then
    export TERM="xterm-256color"
fi
# falls 'ls' die Option '--color' versteht, wird $? auf 0 gesetzt, ansonsten auf 2
ls --color=auto ~ > /dev/null 2> /dev/null
if [ $? -eq 0 ]; then
    alias ls='ls --color=auto'
fi

# zeigt in der PS1 nur die letzten 2 Verzeichnisse an:
export PROMPT_DIRTRIM=2

# was nehmen wir um manpages zu betrachten?
# less! => less hat j/k Unterstützung, most nicht
# export PAGER="less"
export PAGER="vimpager"

shopt -s histappend cdspell checkwinsize

# some more ls aliases
alias ll='ls -lhF'
alias la='ls -AF'
alias l='ls++'

# bare vim as standard editor
export EDITOR=vim
set editing-mode vi

if [ $(uname) == "Darwin" ]; then
    alias g='mvim --remote-silent';
    alias install='brew install';
else
    if [ $(hostname) == "fitzgerald" ]; then
        alias g='gvim --remote-silent';
        alias open='xdg-open';
    elif [ $(hostname) == "kurtis" ]; then
        alias g='gvim --remote-silent';
        alias open='xdg-open';
    else
        alias install='sudo apt-get install';
        alias open='gnome-open';
    fi
fi

# use the right notify depending on the existing ones
if [ -x /usr/bin/notify-send ]; then
    alias notify='/usr/bin/notify-send'
elif [ -x /usr/local/bin/growlnotify ]; then
    alias notify='/usr/local/bin/growlnotify'
fi

alias dimmer='redshift -l 54:12 -t 5700:4000 &'
alias e='$EDITOR'
alias p='$PAGER'
alias vimrc='vim ~/.vimrc'
alias py='python2.7'

# start bc with math library and in quiet mode
alias bc="bc -lq"

alias mathe='cd ~/Dropbox/Studium/Mathematik/'
alias inf='cd ~/Dropbox/Studium/Informatik/'

# random Futurama quote:
function futurama() { curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2; }

# eckige Klammern entfernen:
function removebrackets() { rename 's/\[.*\]\_//' *; }

# öffentliche IP-Adresse:
alias myip='curl ifconfig.me'

# content search
# [http://www.commandlinefu.com/commands/view/8615/content-search.]
ff() { local IFS='|'; grep -rinE "$*" . ; }

# translate a word from English to German:
tw() { dict -d eng-deu $1; }

# connect via rdesktop to appwts.uni-rostock.de
alias appwts='rdesktop -d rechenzentrum -u md261 -g 90% appwts.uni-rostock.de'
alias netwts='rdesktop -d rechenzentrum -u md261 -g 90% netwts.uni-rostock.de'

# convert flac to mp3
flac2mp3() { for f in $1; do flac -cd "$f" | lame -h - "${f%.flac}.mp3"; done; }

einschlafen() { sudo shutdown -s +$1; }

function randompromptsymbol {
    local symbols=(→ ⚛ ☀ ☆ ★ ☺ ☯ ☞ ▹ ♥ ♡ ⧴ ✪)
    local l=${#symbols[*]}
    local sym=${symbols[$(($RANDOM % $l))]}
    echo $sym
}
