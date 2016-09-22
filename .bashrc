. ~/.aliases
. ~/.prompt
. ~/.git-prompt.sh
. ~/.git-completion.bash

# git autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PATH=$PATH:$(npm -g bin)

# added by travis gem
[ -f /Users/steve/.travis/travis.sh ] && source /Users/steve/.travis/travis.sh
