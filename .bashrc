export HISTCONTROL=ignoreboth
export PS1='\u@\h [\t] \w) '

shopt -s histappend cdspell checkwinsize

# some more ls aliases
alias ls='ls -G'
alias ll='ls -lhF'
alias la='ls -AF'
alias l='ls -CF'

# bare vim as standard editor
export EDITOR=vim
export HISTCONTROL=ignoredups

alias dimmer='redshift -l 54:12 -t 5700:4000 &'
alias install='sudo apt-get install'
alias g='gvim --remote-silent'
alias vimrc='vim ~/.vimrc'
alias open='gnome-open'

alias mathe='cd ~/Dropbox/Studium/Mathematik/'
alias inf='cd ~/Dropbox/Studium/Informatik/'

#random Futurama quote:
function futurama() { curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2; }

#eckige Klammern entfernen:
function removebrackets() { rename 's/\[.*\]\_//' *; }
