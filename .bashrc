source ~/.aliases
source ~/.prompt
source ~/.git-prompt.sh

# git autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
