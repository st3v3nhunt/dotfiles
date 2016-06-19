#!/usr/bin/env bash

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

# Sort out permissions
sudo chown -R $(whoami):admin /usr/local

brew install git
brew install bash-completion
brew install node
brew install hub
brew install heroku
brew install ruby
brew install vim
