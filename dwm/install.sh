mkdir -p programs

read -p 'Do you want to install dwm? (y/n): ' dwm
if [ $dwm == 'y' ]; then
    git clone git://git.suckless.org/dwm $HOME/programs/dwm
    cp $HOME/.dotfiles/dwm/config.h $HOME/programs/dwm
    cd $HOME/programs/dwm
    make
    sudo make install

    echo -e "\n#DWM Execution\nexec dwm" >> $HOME/.dotfiles/x/.xinitrc
    echo -e "DWM successfuly installed\n"
fi
