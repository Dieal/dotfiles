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
mkdir -p "$HOME/programs"

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
read -p 'Do you want to install dwm? (y/n): ' dwm
if [ $dwm == 'y' ]; then
    # git clone git://git.suckless.org/dwm $HOME/programs/dwm
    # cp dwm/config.h $HOME/programs/dwm
    # cd $HOME/programs/dwm
    # make
    # sudo make install

    echo -e "\n#DWM Execution\nexec dwm" >> $HOME/.dotfiles/x/.xinitrc
    echo -e "DWM successfuly installed\n"
fi

# Install config files with stow
configs="alacritty scripts fonts xdg bash newsboat x"
stow --target "$HOME" --no-folding $configs 

# Install nvim config
if [ ! -d "$HOME/.config/nvim" ]; then
    git clone https://github.com/Dieal/nvim-config.git $HOME/.config/nvim
else
    echo "[!] Neovim configuration already exists"
fi
