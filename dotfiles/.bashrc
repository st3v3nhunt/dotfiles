# shellcheck source=/dev/null
. ~/.aliases
# . ~/.azure-cli
. ~/.prompt
. ~/.git-prompt.sh
. ~/.git-completion.bash

# git autocomplete
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
  # make autocomplete work with 'g', an alias for git
   __git_complete g __git_main
fi

PATH=$PATH:$(npm -g bin)
export PATH

# added by travis gem
[ -f /Users/steve/.travis/travis.sh ] && source /Users/steve/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Fix error 'gpg: signing failed: Inappropriate ioctl for device'
GPG_TTY=$(tty)
export GPG_TTY

# setup pyenv
eval "$(pyenv init -)"

# Set vim as default editor
export EDITOR=vim
export VISUAL=$EDITOR
