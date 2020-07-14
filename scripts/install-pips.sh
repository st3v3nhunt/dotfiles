#!/usr/bin/env bash

echo "Installing pips"
pip3 install detect-secrets
pip3 install jupyter
pip3 install pre-commit
pip3 install pylint
pip3 install pytest
pip3 install pytest-cache
pip3 install pytest-pep8
pip3 install pytest-watch

echo "Installing ansible"
pip3 install --user ansible
echo "Increase the max number of file handles to fix 'Too many open files' error."
echo "Password will be required"
sudo launchctl limit maxfiles unlimited
