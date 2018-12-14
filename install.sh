#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install base packages
brew install go zsh zsh-completions kubectx
mkdir -p ~/go/bin

# install golang debugger
go get -u github.com/derekparker/delve/cmd/dlv

# install and setup antibody and terminal notifier
brew install getantibody/tap/antibody 
cp .zsh_plugins.txt ~/.zsh_plugins.txt
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install powerlevel9k and nerdfonts
brew tap sambadevi/powerlevel9k
brew install powerlevel9k
brew tap caskroom/fonts
brew cask install font-meslo-nerd-font

# set default shell to zsh
zsh --version
chsh -s $(which zsh)

# merge our zshrc contents if one already exists, otherwise just copy it over
if [ -f ~/.zshrc ]; then
    echo "=== Merging .zshrc Files (MIGHT REQUIRE MANUAL CLEANUP!)==="
    cat .zshrc | cat - ~/.zshrc > temp && rm ~/.zshrc && mv temp ~/.zshrc
else
    echo "=== Copying .zshrc File ==="
    cp .zshrc ~/.zshrc
fi

echo "!! Terminals Must Now Be set to 'MesloLGM Nerd Font' in order to properly display Powerline fonts for Powerlevel9K"
echo ""
echo "!! VS Code settings.json must be copied over once vscode is installed!"
