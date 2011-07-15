export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "
export PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;34m\]\h \[\e[0m\][\t] \w$(__git_ps1 " (%s)"): '
export LC_ALL="de_DE.UTF-8"
PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/local/bin:/usr/texbin:/usr/X11/bin"
export PATH="$PATH:~/.local/bin"
#export TEXINPUTS="$TEXINPUTS:.:/home/hutch/.tex"

# Completion:
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
source ~/dotfiles/git-completion.bash
# zeigt an, ob in einem git-repo was geändert wurde:
# '*' für unstaged
# '+' für staged
GIT_PS1_SHOWDIRTYSTATE=1

# Farben auf dem Terminal
export CLICOLOR=1
# falls 'ls' die Option '--color' versteht, wird $? auf 0 gesetzt, ansonsten auf 2
ls --color=auto ~ > /dev/null 2> /dev/null
if [ $? == 0 ]; then
    alias ls='ls --color=auto'
fi

shopt -s histappend cdspell checkwinsize

# some more ls aliases
alias ll='ls -lhF'
alias la='ls -AF'
alias l='ls -CF'

# bare vim as standard editor
export EDITOR=vim
export HISTCONTROL=ignoredups

if [ $(uname) == "Darwin" ];
then
    alias g='mvim --remote-silent';
    alias install='sudo port install';
else
    alias install='sudo apt-get install';
    alias g='gvim --remote-silent';
    alias open='gnome-open';
fi

alias dimmer='redshift -l 54:12 -t 5700:4000 &'
alias e='$EDITOR'
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
