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

xset -b

# Set the NASA Image Of The Day as the current background:
sh $HOME/dotfiles/bin/NASABackground.sh

# A dimmer for the evening hours:
redshift -l 54:12 -t 5500:3600 -m randr 2> /dev/null &

# More recent X servers don't terminate on C-A-Backspace anymore.
# This enables it again.
setxkbmap -option terminate:ctrl_alt_bksp

# gvim vimwiki:
gvim -c ":VimwikiIndex" --name "gvimwiki" &

# Chrome:
google-chrome &

# mutt in a gnome-terminal:
gnome-terminal --title="mailer" -e 'bash -c "export TERM=xterm-256color; mutt; bash"' &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec awesome
#exec herbstluftwm
# exec openbox-session
#exec ck-launch-session dbus-launch --exit-with-session startxfce4
#exec xmonad
