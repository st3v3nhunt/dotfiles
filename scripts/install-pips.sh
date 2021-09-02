#!/usr/bin/env bash

echo "Installing latest version of pip3"
python3 -m pip install --upgrade pip

pips=(
detect-secrets
jupyter
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

echo "Increase the max number of file handles to fix 'Too many open files' error."
echo "Password will be required"
sudo launchctl limit maxfiles unlimited
