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

# A dimmer for the evening hours:
redshift -l 54:12 -t 5500:3600 -m randr 2> /dev/null &

# More recent X servers don't terminate on C-A-Backspace anymore.
# This enables it again.
setxkbmap -option terminate:ctrl_alt_bksp

# gvim vimwiki:
gvim -c ":VimwikiIndex" --name "gvimwiki" &

# Chrom(e|ium)
if [ -x /usr/bin/google-chrome ]; then
    google-chrome &
elif [ -x /usr/bin/chromium ]; then
    chromium &
fi

# Socializing stuff:
# mutt in a gnome-terminal:
gnome-terminal --title="mailer" -e 'bash -c "export TERM=xterm-256color; mutt; bash"' &
# xchat:
if [ -x /usr/bin/xchat ]; then
    xchat &
fi
# pidgin:
if [ -x /usr/bin/pidgin ]; then
    pidgin &
fi

# a gnome-terminal for maintenance:
gnome-terminal --title="admin" &

# Set the NASA Image Of The Day as the current background:
sh $HOME/dotfiles/bin/NASABackground.sh

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec ck-launch-session dbus-launch --exit-with-session awesome
#exec herbstluftwm
# exec openbox-session
#exec ck-launch-session dbus-launch --exit-with-session startxfce4
#exec xmonad