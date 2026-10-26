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
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# Completions shipped by Homebrew formulae. Sourcing these files is much
# faster than generating them with e.g. `kubectl completion bash` on each start
for _completion in kubectl minikube tmux; do
  [[ -r "$HOMEBREW_PREFIX/etc/bash_completion.d/$_completion" ]] && source "$HOMEBREW_PREFIX/etc/bash_completion.d/$_completion"
done
unset _completion

# Set vi keybindings for use in prompt
set -o vi

# completions
complete -C "$(which vault)" vault
complete -C "$(which aws_completer)" aws
complete -C "$(which terraform)" terraform

# Deno autocomplete
source "$(brew --prefix)/etc/bash_completion.d/deno.bash"

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


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
