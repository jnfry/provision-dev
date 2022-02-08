#!/bin/sh

set -eux

# Update to Rosetta 2
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# To install gcc, make etc. we need to include Xcode command line dev tools
# it's a stupid requirement but #macintoshlyf
echo 'Installing Xcode Command Line Tools...'
softwareupdate --all --install --force

mkdir -p ~/src/jnfry/

git clone https://github.com/jnfry/provision-dev.git ~/src/jnfry/provision-dev

cd ~/src/jnfry/provision-dev/
bash ./install.sh
