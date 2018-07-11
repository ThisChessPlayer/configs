#!/bin/bash

# Color codes
YELLOW="\e[93m"
CYAN="\e[36m"
WHITE="\e[97m"

echo -e "${YELLOW}[${CYAN}Setup${YELLOW}] ${WHITE}Installing packages"
sudo apt-get install -y build-essential vim-gnome tmux libncurses5-dev libncursesw5-dev

# Set up directories
echo -e "${YELLOW}[${CYAN}Setup${YELLOW}] ${WHITE}Setting up directories"
mkdir ~/projects
mkdir ~/projects/workspace
mkdir ~/projects/scripts
mkdir ~/.vim
mkdir ~/.vim/colors

# Copy config files
echo -e "${YELLOW}[${CYAN}Bash${YELLOW}] ${WHITE}Setting up bashrc"
cd rpi
cp .bashrc ~
cd ..

echo -e "${YELLOW}[${CYAN}Tmux${YELLOW}] ${WHITE}Setting up tmux"
cd tmux
cp .tmux.conf ~
cp tmuxSetup.sh ~/projects/scripts
cd ..

echo -e "${YELLOW}[${CYAN}Vim${YELLOW}] ${WHITE}Setting up vim"
cd vim
cp .vimrc ~
cp JAM256.vim ~/.vim/colors
cd ..

echo -e "${YELLOW}[${CYAN}Htop${YELLOW}] ${WHITE}Setting up htop"
cd htop-2.0.2-custom
./configure
touch *
make
sudo make install
cd ..

echo -e "${YELLOW}[${CYAN}Git${YELLOW}] ${WHITE}Setting up git"
git config --global user.email "jasonma5501@gmail.com"
git config --global user.name "Jason Ma"

echo -e "${YELLOW}[${CYAN}Hostname${YELLOW}] ${WHITE}Setting up hostname"
sudo sed -i -e 's/raspberrypi/jampi/g' /etc/hostname
sudo sed -i -e 's/raspberrypi/jampi/g' /etc/hosts

source ~/.bashrc
