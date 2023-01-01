mkdir -p programs

read -p 'Do you want to install dwm? (y/n): ' dwm
if [ $dwm == 'y' ]; then

    # Checks if the dwm folder already exists
    if [ ! -d "$HOME/programs/dwm" ]; then
        git clone git://git.suckless.org/dwm $HOME/programs/dwm
    else
        cd $HOME/programs/dwm
        git pull --quiet
    fi

    cp $HOME/.dotfiles/dwm/config.h $HOME/programs/dwm
    cd $HOME/programs/dwm
    make
    sudo make install

    # Checks that the command above ran successfully
    if [ $? -eq 0 ]; then
        sudo echo -e "\n#DWM Execution\nexac dwm" >> $HOME/.dotfiles/x/.xinitrc
        echo -e "\nDWM successfully installed\n"
    else
        echo -e "\nDWM was not installed"
    fi
fi
