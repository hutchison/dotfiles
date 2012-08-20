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

export TERMINAL="terminator"

# disable bell:
xset -b
# disable CAPS LOCK and map ESC to it:
xmodmap ~/.xmodmap

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
# mutt in a $terminal:
$TERMINAL --title="mailer" -e 'zsh -c "export TERM=xterm-256color; mutt; zsh"' &
# xchat:
if [ -x /usr/bin/xchat ]; then
    xchat &
fi
# pidgin:
if [ -x /usr/bin/pidgin ]; then
    pidgin &
fi

# a $terminal for maintenance:
$TERMINAL --title="admin" &

# Set the NASA Image Of The Day as the current background:
sh $HOME/dotfiles/bin/NASABackground.sh


DEFAULT_SESSION=i3

case $1 in
    i3)
        exec i3
        ;;
    xfce4)
        exec dbus-launch --exit-with-session startxfce4
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec ck-launch-session dbus-launch --exit-with-session awesome
#exec i3
#exec herbstluftwm
# exec openbox-session
#exec ck-launch-session dbus-launch --exit-with-session startxfce4
#exec xmonad
