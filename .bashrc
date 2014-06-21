export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000
export PS1='\[\e[0;32m\]\u\[\e[0m\]@\[\e[0;34m\]\h \[\e[0m\]\t \w$(__git_ps1 " (%s)") '
export LC_ALL="de_DE.UTF-8"
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin"
LOCALBIN="~/.local/bin"
TEXBIN="/usr/local/texlive/2011/bin/x86_64-linux/:/usr/local/texlive/2011/bin/x86_64-darwin/"
PERLBIN="/usr/bin/vendor_perl/"
AUSWERTUNGBIN="~/.auswertung/"
RUBYPATH="~/.gem/ruby/1.9.1/bin/"
export PATH="$PATH:$LOCALBIN:$TEXBIN:$PERLBIN:$AUSWERTUNGBIN:$RUBYPATH"
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
# Homebrew bash completion (falls sie existiert)
if [ -f /usr/local/Library/Contributions/brew_bash_completion.sh ]; then
    . /usr/local/Library/Contributions/brew_bash_completion.sh
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
if which vimpager >/dev/null 2>/dev/null; then
    export PAGER="vimpager"
else
    export PAGER="less"
fi

shopt -s histappend cdspell checkwinsize

# some more ls aliases
alias ll='ls -lhF'
alias la='ls -AF'
# only alias ls++ if it's available:
if which 'ls++' >/dev/null 2>&1; then
    alias l='ls++'
fi

export EDITOR=vi
set editing-mode vi

# host-depending aliases (now with better overview):
case $(hostname) in
    rupert.local)   # <-- because on `hostname -s` returns "localhost" on the other hosts >m(
        alias g='mvim --remote-silent';
        alias inst='brew install';
        alias gvimwiki='mvim -c ":VimwikiIndex"';
        ;;
    fitzgerald|kurtis|marquis)
        alias g='gvim --remote-silent';
        alias open='xdg-open';
        alias inst='sudo pacman -S';
        alias gvimwiki='gvim -c ":VimwikiIndex" --name gvimwiki';
        ;;
esac

# use the right notify depending on the existing ones
if [ -x /usr/bin/notify-send ]; then
    alias notify='/usr/bin/notify-send'
elif [ -x /usr/local/bin/growlnotify ]; then
    alias notify='/usr/local/bin/growlnotify'
fi

alias dimmer='redshift -l 54:12 -t 5700:4000 -m randr 2> /dev/null &'
alias e='$EDITOR'
alias p='$PAGER'
alias vimrc='vim ~/.vimrc'
alias py='python2.7'

alias servieren='python -m http.server'
alias neuespw='pwgen -B 12 1'

# Alias for taskwarrior
alias tw='task'

# start bc with math library and in quiet mode
alias bc="bc -lq"

alias mathe='cd ~/Dropbox/Studium/Mathematik/'
alias inf='cd ~/Dropbox/Studium/Informatik/'

# eckige Klammern entfernen:
function removebrackets() { rename 's/\[.*\]\_//' *; }

# öffentliche IP-Adresse:
alias myip='curl ifconfig.me'

# content search
# [http://www.commandlinefu.com/commands/view/8615/content-search.]
ff() { local IFS='|'; grep -rinE "$*" . ; }

# translate a word from English to German:
trw() { dict -d eng-deu $1; }

# connect via rdesktop to appwts.uni-rostock.de
alias appwts='rdesktop -d rechenzentrum -u md261 -g 95% appwts.uni-rostock.de'
alias netwts='rdesktop -d rechenzentrum -u md261 -g 95% netwts.uni-rostock.de'

# convert flac to mp3
flac2mp3() { for f in $1; do flac -cd "$f" | lame -h - "${f%.flac}.mp3"; done; }

einschlafen() { sudo shutdown -s +$1; }

function randompromptsymbol {
    local symbols=(→ ⚛ ☀ ☆ ★ ☺ ☯ ☞ ▹ ♥ ♡ ⧴ ✪)
    local l=${#symbols[*]}
    local sym=${symbols[$(($RANDOM % $l))]}
    echo $sym
}
