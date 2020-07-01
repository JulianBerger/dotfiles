#!/usr/bin/env zsh

set -eu

# install homebrew
echo | zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Installing brews and casks"
HOMEBREW_NO_ENV_FILTERING=1 ACCEPT_EULA=y brew bundle install -v --file ./Brewfile
echo "Installing fonts"
HOMEBREW_NO_ENV_FILTERING=1 ACCEPT_EULA=y brew bundle install -v --file ./Brewfile-Fonts

echo "Setup zsh"
zsh ./zsh.sh

echo "Setup MacOS"
zsh ./macos.sh

echo "Setup Node.js"
zsh ./node.sh

echo "Successfully installed julianberger/dotfiles! Note that some of these changes require a logout/restart to take effect."
