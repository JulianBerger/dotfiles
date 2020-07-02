#!/usr/bin/env zsh

# Aliases for VSCode to edit zshrc
echo "alias zshconfig=\"code ~/.zshrc\"" >> ~/.zshrc
echo "alias ohmyzsh=\"code ~/.oh-my-zsh\"" >> ~/.zshrc
# Setup zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
# Run neofetch on zsh start
echo "neofetch" >> ~/.zshrc
source ~/.zshrc
