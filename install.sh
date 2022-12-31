#!/usr/bin/sh
# Script that install programs and configs to a new system

###################### Boilerplate and preparation ######################

# Function that checks if a command exists
function check_prog() {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting..."
        exit 1
    fi
}


mkdir -p "$HOME/.config"

#########################################################################

# Check if the script is running from ~/.dotfiles/
if [[ ! $(pwd) == $HOME/.dotfiles ]]; then
    echo "Run the script from ~/.dotfiles/"
    exit
fi

# Install needed programs
# (Edit 'programs.txt' to decide which programs to install)
sudo pacman -Sy
sudo pacman -S --needed - < programs.txt

check_prog stow
check_prog curl
check_prog git

# DWM Installation
dwm/install.sh

cd $HOME/.dotfiles/

# Install config files with stow
configs="alacritty scripts fonts xdg bash newsboat x"
stow --target "$HOME" --no-folding $configs 

# Install nvim config
if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/Dieal/nvim-config.git $HOME/.config/nvim
else
    echo "[!] Neovim configuration already exists"
fi
