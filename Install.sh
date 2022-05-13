#!/bin/bash

# This is a rudimentary installation script for new computers.
# Usage: sh Install.sh.

# ----
# This file makes a lot of assumptions about your current working environment.
# Over time I hope to edit this down to a heavily reproducible script.
# Ideally a global cloud store for these is ideal, something like how VSCode lets you sync across computers via an account.
# ----

echo '-----------------'
echo 'Making dir.'
mkdir ~/.zsh
mkdir ~/.config
mkdir ~/opt

echo '-----------------'
echo 'Moving Configurations hyper, starship, and zshrc'
cp hyper.js ~/.hyper.js
cp starship.toml ~/.config/starship.toml
cp .zshrc ~/.zshrc

echo '-----------------'
echo 'Refreshing Terminal'
source ~/.zshrc

# https://docs.brew.sh/Installation#untar-anywhere
echo '-----------------'
echo 'Installing Homebrew For ARM Processors'
cd ~/opt && mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"

echo '-----------------'
echo 'Installing wget For Peer Dependency'
brew install wget

# https://tjay.dev/howto-my-terminal-shell-setup-hyper-js-zsh-starship/
echo '-----------------'
echo 'Adding git@github.com:zdharma/fast-syntax-highlighting.git to .zshrc'
cd ~/.zsh && git clone git@github.com:zdharma/fast-syntax-highlighting.git

echo '-----------------'
echo 'Adding https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh to .zshrc'
cd ~/.zsh && wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/lib/completion.zsh

echo '-----------------'
echo 'Installing Hyper Plugins'
hyper i hyper-font-ligatures
hyper i hyper-pane
hyper i hyper-search
hyper i hypercwd
hyper i hyper-active-tab
hyper i hyperline

exit()