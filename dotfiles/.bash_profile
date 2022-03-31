# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init bash pre)"

# shellcheck source=.bashrc
. ~/.bashrc
export GPG_TTY=$(tty)

# Fig post block. Keep at the bottom of this file.
eval "$(fig init bash post)"
