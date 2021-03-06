#!/bin/sh
set -eux

# Setup homebrew, your main package manager
echo 'Installing Homebrew...'
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/fry/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'Running brew update...'
brew update

brew install ansible

git remote remove origin
git remote add origin git@github.com:jnfry/provision-dev.git

cd mac-ansible
make install
