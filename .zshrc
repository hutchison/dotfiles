# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hutch/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls="ls -G"
alias la="ls -a"
alias ll="ls -al"
alias vi="vim"
alias e="vim"
alias g="mvim --remote-silent"

alias dimmer='redshift -l 54:12 -t 5700:4000 &'
#alias open='gnome-open'

export PS1="%F{green}%n%f@%F{blue}%m%f %* %~ → "
