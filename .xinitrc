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

# start networkmanager applet
ck-launch-session nm-applet --sm-disable &

# A dimmer for the evening hours:
redshift -l 54:12 -t 5500:3600 -m randr 2> /dev/null &

# More recent X servers don't terminate on C-A-Backspace anymore.
# This enables it again.
setxkbmap -option terminate:ctrl_alt_bksp

export TERMINAL=terminator

# gvim vimwiki:
gvim -c ":VimwikiIndex" --name "gvimwiki" &

# Chrom(e|ium)
if [ -x /usr/bin/google-chrome ]; then
    google-chrome &
elif [ -x /usr/bin/chromium ]; then
    chromium &
fi

# Socializing stuff:
# xchat:
if [ -x /usr/bin/xchat ]; then
    xchat &
fi
# pidgin:
if [ -x /usr/bin/pidgin ]; then
    pidgin &
fi
# mutt in a gnome-terminal:
$TERMINAL --title="mailer" -e 'zsh -c "export TERM=xterm-256color; mutt; zsh"' &

# a gnome-terminal for maintenance:
$TERMINAL --title="admin" &

# Set the NASA Image Of The Day as the current background:
sh $HOME/dotfiles/bin/NASABackground.sh

# start Dropbox
dropbox start &
# and SparkleShare
sparkleshare start &

DEFAULT_SESSION=i3

case $1 in
    i3)
        exec ck-launch-session i3
        ;;
    gnome)
        exec ck-launch-session gnome-session
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac
