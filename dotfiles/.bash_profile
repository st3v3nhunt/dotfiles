# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:/Users/shunt/.docker/bin"
# End of Docker Desktop section.

# shellcheck source=.bashrc
. ~/.bashrc
GPG_TTY=$(tty)
export GPG_TTY
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
