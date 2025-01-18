# shellcheck source=.bashrc
. ~/.bashrc
GPG_TTY=$(tty)
export GPG_TTY
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
