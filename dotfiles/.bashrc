# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init bash pre)"

# shellcheck source=/dev/null
source ~/.aliases
source ~/.functions
source ~/.prompt
source ~/.git-prompt.sh
source ~/.git-completion.bash
source ~/.shared-shell-setup
# make git completion work with 'g', an alias for git
__git_complete g __git_main

# bash completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && source "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# tmux completion
source "$(brew --prefix tmux)/etc/bash_completion.d/tmux"

# Kubernetes and minikube autocompletion
source <(kubectl completion bash)
source <(minikube completion bash)

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
  source "$(brew --prefix)/etc/bash_completion.d/deno.bash"
else
  source /usr/local/etc/bash_completion.d/deno.bash
fi

# bash parameter completion for the dotnet CLI
_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
  # shellcheck disable=SC2181
  if [ $? -ne 0 ]; then
    completions=""
  fi

  # shellcheck disable=SC2207
  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

complete -f -F _dotnet_bash_complete dotnet

# Rust (Cargo)
source "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Fig post block. Keep at the bottom of this file.
eval "$(fig init bash post)"
