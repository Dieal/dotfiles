# Sets background
feh --bg-scale /home/chilling/documents/wallpapers/Wallpaper2.png

# Starts dwm
exec dwm

# Fix Slow Opening GTK
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# Replaces CAPS Lock with ESC
setxkbmap -option caps:swapescape
