#!/usr/bin/env bash

set -eu

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brews and casks"
brew bundle install --file ./Brewfile

echo "Setup MacOS"
zsh ./macos.sh

echo "Setup Node.js"
zsh ./node.sh

echo "Successfully installed julianberger/dotfiles! Note that some of these changes require a logout/restart to take effect."
