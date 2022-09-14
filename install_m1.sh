#!/bin/bash

# install homebrew
if ! which brew >/dev/null 2>&1; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# install rust
if ! which rustup >/dev/null 2>&1; then
	curl https://sh.rustup.rs -sSf | sh -s -- -y
	source ~/.cargo/env
	rustup default stable
	source "$Home/.cargo/env"
else
	rustup update
fi

# Rust toolchains and commands
rustup component add clippy
rustup target add aarch64-apple-ios armv7-apple-ios armv7s-apple-ios x86_64-apple-ios i386-apple-ios
rustup target add aarch64-linux-android armv7-linux-androideabi i686-linux-android
rustup target add wasm32-unknown-unknown

# install environment tools and languages
brew install zsh zsh-completions kubectx hub shfmt go
brew install --cask google-cloud-sdk

# install and setup antibody
brew install antibody
cp .zsh_plugins.txt ~/.zsh_plugins.txt
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update

# install powerlevel9k and nerdfonts
brew tap sambadevi/powerlevel9k
brew install powerlevel9k
brew tap homebrew/cask-fonts
brew install --case font-meslo-lg-nerd-font
brew install --case iterm2
brew install --case visual-studio-code

# copy vscode settings
mkdir -p ~/Library/Application\ Support/Code/User
cp settings.json ~/Library/Application\ Support/Code/User/settings.json

# set default shell to zsh
zsh --version

# merge our zshrc contents if one already exists, otherwise just copy it over
if [ -f ~/.zshrc ]; then
    echo "=== Merging .zshrc Files (MIGHT REQUIRE MANUAL CLEANUP!) ==="
    cat .zshrc | cat - ~/.zshrc > temp && rm ~/.zshrc && mv temp ~/.zshrc
else
    echo "=== Copying .zshrc File ==="
    cp .zshrc ~/.zshrc
fi

# git settings/aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.com commit
git config --global alias.st status
git config --global credential.helper osxkeychain

echo "!! Terminal Apps need 'MesloLGM Nerd Font' in order to properly display Powerline Fonts"
