# The following lines were added by Docker Desktop to add commands to your PATH.
export PATH="$PATH:$HOME/.docker/bin"
# End of Docker Desktop section.

install_paths=(
  "/usr/local/bin/brew"
  "/home/linuxbrew/.linuxbrew/bin/brew"
  "/opt/homebrew/bin/brew"
)

for ipath in "${install_paths[@]}"; do
  # echo "Test: $ipath"
  if command -v "$ipath" &> /dev/null; then
    # echo "Found: $ipath"
    eval "$($ipath shellenv)"
  fi
done
