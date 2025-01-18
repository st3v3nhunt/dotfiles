#!/usr/bin/env bash

echo "Install Python3 virtual env for Neovim"
PY3_VER=3.9.7
pyenv install -s $PY3_VER
pyenv virtualenv -f $PY3_VER nvim

echo "Installing latest version of pip3"
python3 -m pip install --upgrade pip

pips=(
detect-secrets

pre-commit
pylint
pynvim
pytest
pytest-cache
pytest-pep8
pytest-watch
)

for pip in "${pips[@]}"; do
  echo "Installing latest version of $pip"
  pip3 install --upgrade "$pip"
done

echo "Installing ansible"
pip3 install --user ansible

echo "Installing poetry package manager"
curl -sSL https://install.python-poetry.org | python3 -

# Install pre-commit hook script
pre-commit init-templatedir ~/.git-template

echo "Increase the max number of file handles to fix 'Too many open files' error."
echo "Password will be required"
sudo launchctl limit maxfiles unlimited
