#! /bin/bash

sudo apt-get install audacity simplescreenrecorder slack-desktop abiword gnumeric texlive-base nodejs npm neovim ksh kitty devhelp build-essential gdb cppreference-doc-en-html python3 python3-pip python3-doc python3-numpy lua-doc lua5.3 groff pavucontrol guake wget stow linux-tools-common linux-tools-generic

flatpak install spotify dejadup boxes

mkdir -p $HOME/.local/src
cd $HOME/.local/src
git clone git@github.com:jeaye/stdman.git
cd stdman
./configure
sudo make install
sudo mandb


cd $HOME/.dotfiles

rm $HOME/.login
stow login

stow kitty
stow nvim
stow ksh

stow guake
guake --restore-preferences $HOME/.config/guake/guake.conf


FONTDIR=$HOME/.local/share/fonts
mkdir -p $FONTDIR

# fonts
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Medium/complete/Fira%20Code%20Medium%20Nerd%20Font%20Complete%20Mono.ttf $FONTDIR
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/complete/Fira%20Code%20Bold%20Nerd%20Font%20Complete%20Mono.ttf $FONTDIR
wget https://github.com/Avi-D-coder/FiraCode-italic/raw/master/FiraCode-BoldItalic.otf $FONTDIR
wget https://github.com/Avi-D-coder/FiraCode-italic/raw/master/FiraCode-RegularItalic.otf $FONTDIR


sudo update-alternatives --config x-terminal-emulator
cat /etc/shells
chsh




