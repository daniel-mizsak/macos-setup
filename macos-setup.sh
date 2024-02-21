#!/bin/bash

# Install xcode command line tools
# Source: https://github.com/samdoran/ansible-collection-macos/blob/main/scripts/bootstrap.sh
echo "Installing xcode command line tools"
set -euo pipefail

if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    TMP_FILE=/private/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    touch "$TMP_FILE"
    PACKAGE_NAME=$(sudo softwareupdate -l | grep -o 'Command Line Tools for Xcode-.*' | tail -n 1 | tr -d '\n')
    sudo softwareupdate --install "$PACKAGE_NAME"
    rm -fv "$TMP_FILE"
fi

# Clone the repository
echo "Cloning macos-setup repository"
if [[ -d ${HOME}/macos-setup ]]; then
    rm -rf ${HOME}/macos-setup
fi
git clone https://github.com/daniel-mizsak/macos-setup.git ${HOME}/macos-setup --quiet

# Create python virtual environment and install ansible
echo "Creating python virtual environment and installing ansible"
if [[ ! -d ${HOME}/macos-setup/.venv ]]; then
    python3 -m venv --upgrade-deps ${HOME}/macos-setup/.venv > /dev/null
fi
source ${HOME}/macos-setup/.venv/bin/activate
pip3 install -r ${HOME}/macos-setup/ansible/requirements.txt -qqq

# Installing homebrew
echo "Installing homebrew"
ansible-playbook ${HOME}/macos-setup/ansible/homebrew.yml
eval "$(/opt/homebrew/bin/brew shellenv)"

# Run macos-setup
echo "Running the main playbook"
ansible-playbook ${HOME}/macos-setup/ansible/playbook.yml
