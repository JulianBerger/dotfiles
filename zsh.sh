#!/usr/bin/env zsh

# Preferred editor for local and remote sessions
echo "if [[ -n $SSH_CONNECTION ]]; then # SSH mode" >> ~/.zshrc
echo "  export EDITOR='vim'" >> ~/.zshrc
echo "else # Local terminal mode" >> ~/.zshrc
echo "  export EDITOR='code -w'" >> ~/.zshrc
echo "fi" >> ~/.zshrc

# Aliases for VSCode to edit zshrc
echo "alias zshconfig='code ~/.zshrc' >> ~/.zshrc
echo "alias ohmyzsh='code ~/.oh-my-zsh' >> ~/.zshrc
# Setup zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
# Run neofetch on zsh start
echo "neofetch" >> ~/.zshrc
source ~/.zshrc
