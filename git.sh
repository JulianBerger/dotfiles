#!/usr/bin/env zsh

set -eu

# Set git to use the osxkeychain credential helper
git config --global credential.helper osxkeychain
git config --global user.name "JulianBerger"
git config --global user.email "jberger95@gmail.com"