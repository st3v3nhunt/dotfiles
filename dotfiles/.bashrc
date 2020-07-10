# shellcheck source=/dev/null
. ~/.aliases
. ~/.functions
. ~/.prompt
. ~/.git-prompt.sh
. ~/.git-completion.bash
. ~/.shared-shell-setup
# make git completion work with 'g', an alias for git
__git_complete g __git_main

# bash completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# tmux completion
. "$(brew --prefix tmux)/etc/bash_completion.d/tmux"

# Kubernetes and minikube autocompletion
source <(kubectl completion bash)
source <(minikube completion bash)

# added by travis gem
[ -f /Users/steve/.travis/travis.sh ] && source /Users/steve/.travis/travis.sh

# Fix error 'gpg: signing failed: Inappropriate ioctl for device'
GPG_TTY=$(tty)
export GPG_TTY

# Set vim as default editor
export EDITOR=vim
export VISUAL=$EDITOR

# Set vi keybindings for use in prompt
set -o vi

complete -C /usr/local/bin/vault vault
complete -C /usr/local/bin/aws_completer aws

# Deno autocomplete
if [[ -n "$WSL_DISTRO_NAME" ]]; then
  source /home/linuxbrew/.linuxbrew/etc/bash_completion.d/deno.bash
else
  source /usr/local/etc/bash_completion.d/deno.bash
fi
