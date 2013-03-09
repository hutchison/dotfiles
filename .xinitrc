#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# disable bell:
xset -b
# disable CAPS LOCK and map ESC to it:
xmodmap ~/.xmodmap

# A dimmer for the evening hours:
#redshift -l 54:12 -t 5500:3600 -m randr 2> /dev/null &
if [ -x $(which redshiftgui) ]; then
    redshiftgui &
fi

# ALSA-Tray for volume control:
if [ -x $(which alsa-tray) ]; then
    alsa-tray &
fi

# More recent X servers don't terminate on C-A-Backspace anymore.
# This enables it again.
setxkbmap -option terminate:ctrl_alt_bksp

export TERMINAL=terminator

# gvim vimwiki:
#gvim -c ":VimwikiIndex" --name "gvimwiki" &

# Chrome
if [ -x $(which google-chrome) ]; then
    google-chrome &
    export BROWSER=google-chrome
fi

# Socializing stuff:
# xchat:
if [ -x $(which xchat) ]; then
    xchat &
fi
# pidgin:
if [ -x $(which pidgin) ]; then
    pidgin &
fi
# mutt in a gnome-terminal:
#$TERMINAL --title="mailer" -e 'zsh -c "export TERM=xterm-256color; mutt; zsh"' &

# a gnome-terminal for maintenance:
$TERMINAL --title="admin" --geometry=1000x600 &

# Set the NASA Image Of The Day as the current background:
sh $HOME/dotfiles/bin/NASABackground.sh

# start Dropbox
if [ -x $(which dropbox) ]; then
    dropbox start &
fi
# and SparkleShare
if [ -x $(which sparkleshare) ]; then
    sparkleshare start &
fi

# der GnuPG Agent:
if [ -x $(which gpg-agent) ]; then
    eval $(gpg-agent --daemon) &
fi

exec i3
