#!/bin/bash
# This file is used to setup Manjro for my setup
#the commands for verbose and redundant for better calrity 

set -e  # Exit on error

paru -S rustup
rustup install stable

sudo pacman -Syu base-devel rustup --noconfirm

# Install Paru if not already installed
if ! command -v paru &> /dev/null
then
    echo "Paru not found. Installing Paru..."
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si --noconfirm
fi

# install Fish
paru -Syyu --noconfirm fish

# Make Fish the default shell 
chsh -s $(which fish)

# Install OMF
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish -c " fish install --path=~/.local/share/omf --config=~/.config/omf --noninteractive --yes"

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
fish -c 'alias ps "ps auxfh"; funcsave ps;' 

# Install Fastfetch
paru -S fastfetch --noconfirm
#Installing Bismuth for tiling
paru -S kwin-bismuth --noconfirm
#installing vs-code and vscode insiders
paru -S visual-studio-code-bin --noconfirm
paru -S visual-studio-code-insiders-bin --noconfirm
#installing Forceblur
paru -S kwin-scripts-forceblur --noconfirm
#Enabling kwin forceblur
bash -c "mkdir -p ~/.local/share/kservices5/
cp ~/.local/share/kwin/scripts/forceblur/metadata.desktop ~/.local/share/kservices5/forceblur.desktop"
#Installing spotify 
paru -S spotify --noconfirm
#installing Brave
paru -S brave-bin --noconfirm
#installing Kitty
paru -S kitty --noconfirm                                                                                                                                                                                           130 (9.438s)

#Updating system
paru 

# Configure launch options
printf "if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
    export TERM=screen-256color
    set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
end\n" > ~/.config/fish/config.fish


echo "Fish installation complete! Restart your terminal to start using Fish."
