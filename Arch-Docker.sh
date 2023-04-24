#!/bin/bash
# This file is used to setup Fish

set -e  # Exit on error

# Update system and install required packages
pacman --noconfirm -Syu paru git curl

# Install Fish
sudo paru -S fish

# Make Fish the default shell 
chsh -s $(which fish)

# Install OMF
curl -sL https://get.oh-my.fish | fish

# Install OMF themes
fish -c "omf install neolambda"

# Install Fisher
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# Install Fisher extensions
fish -c "fisher install jorgebucaran/nvm.fish"
fish -c "fisher install jorgebucaran/replay.fish"
fish -c "fisher install franciscolourenco/done"
fish -c "fisher install gazorby/fish-abbreviation-tips"
fish -c "fisher install acomagu/fish-async-prompt"
fish -c "fisher install joseluisq/gitnow@2.11.0"
fish -c "fisher install meaningful-ooo/sponge"

# Set aliases
fish -c 'alias dog "code"; funcsave dog;' 
fish -c 'alias dawg "code-insiders"; funcsave dawg;'
fish -c 'alias lss "ls -a -h"; funcsave lss;'
fish -c 'alias rmf "rm -r -f"; funcsave rmf;'

# Configure launch options
printf "if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    export TERM=screen-256color
end\n" >> ~/.config/fish/config.fish

# Install Fastfetch
sudo pacman --noconfirm -Syu fastfetch

echo "Fish installation complete! Restart your terminal to start using Fish."