#!/usr/bin/env zsh

# Setup nvm
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
echo "source $(brew --prefix nvm)/nvm.sh" >> ~/.zhsrc
source ~/.zshrc

nvm install node
nvm use node

npm install -g yarn
npm install -g npx
npm install -g np
npm install -g npm-name-cli

# debugging
npm install -g ndb
npm install -g node-inspector

# general utilities
npm install -g tldr
npm install -g now
npm install -g spoof
npm install -g fkill-cli
npm install -g castnow
npm install -g github-is-starred-cli
npm install -g vtop

# react
npm install -g create-react-app
npm install -g create-react-library
npm install -g react-native-cli

# angular
npm install -g @angular/cli

# gatsby
npm install -g gatsby-cli

# linting
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-config-standard
npm install -g eslint-config-standard-react
npm install -g eslint-config-standard-jsx
npm install -g eslint-plugin-react
npm install -g eslint-config-prettier
npm install -g eslint-plugin-prettier
npm install -g prettier
npm install -g standard
npm install -g typescript