#!/usr/bin/sh
# Script that install programs and configs to a new system

###################### Boilerplate and preparation ######################

# Repository update
git pull --quiet

# Function that checks if a command exists
function check_prog() {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting..."
        exit 1
    fi
}

# Check if the script is running from ~/.dotfiles/
if [[ ! $(pwd) == $HOME/.dotfiles ]]; then
    echo "Run the script from ~/.dotfiles/"
    exit
fi

mkdir -p "$HOME/.config"

#########################################################################

# Install needed programs
# (Edit 'programs.txt' to decide which programs to install)
read -p "Do you want to install the programs specified in programs.txt? (y/n): " programs
if [ $programs == "y" ]; then
    sudo pacman -Sy
    sudo pacman -S --needed - < programs.txt
fi

check_prog stow
check_prog curl
check_prog git

# DWM Installation
dwm/install.sh

cd $HOME/.dotfiles/

read -p "Do you want to install the config files specified in configs.txt? (y/n): " dotf_answer
if [ $dotf_answer == "y" ]; then
    # Install config files with stow
    stow --target "$HOME" --no-folding $(cat configs.txt)

    if [ $? -eq 0 ]; then
        echo -e "\n[!] Stow ran into conflicts with some files"
    fi
fi

# Install nvim config
if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/Dieal/nvim-config.git $HOME/.config/nvim
else
    echo -e "\n[!] Neovim configuration already exists"
fi
