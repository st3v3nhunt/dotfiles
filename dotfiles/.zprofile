if [[ -n "$WSL_DISTRO_NAME" && "$OSTYPE" == "linux-gnu" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
