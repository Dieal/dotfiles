# Sets background
feh --bg-scale /home/chilling/documents/wallpapers/wallpaper2.jpg

# Starts dwm
exec dwm

# Fix Slow Opening GTK
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# Replaces CAPS Lock with ESC
setxkbmap -option caps:swapescape
