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

# Utils
brew install git
brew install bash-completion
brew install hub
brew install heroku
brew install the_silver_searcher
brew install cmake

# THE editor?! 
brew install vim

# Languages
brew install mono
brew install go
brew install rust
brew install python
brew install ruby
brew install node
