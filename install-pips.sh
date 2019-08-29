#!/usr/bin/env bash

printf "Installing pips\\n"
pip3 install --user azure-cli
pip3 install jupyter
pip3 install pylint
pip3 install pytest
pip3 install pytest-cache
pip3 install pytest-pep8
pip3 install pytest-watch

printf "Installing ansible\\n"
pip3 install --user ansible
printf "Increase the max number of file handles to fix 'Too many open files' error.\\n"
printf "Password will be required\\n"
sudo launchctl limit maxfiles unlimited
