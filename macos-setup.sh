#!/bin/bash

# Install xcode command line tools
# Source: https://github.com/samdoran/ansible-collection-macos/blob/main/scripts/bootstrap.sh
echo "Installing xcode command line tools."
set -euo pipefail

if [[ ! -d /Library/Developer/CommandLineTools ]]; then
    TMP_FILE=/private/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    touch "$TMP_FILE"
    PACKAGE_NAME=$(sudo softwareupdate -l | grep -o 'Command Line Tools for Xcode-.*' | tail -n 1 | tr -d '\n')
    sudo softwareupdate --install "$PACKAGE_NAME"
    rm -fv "$TMP_FILE"
fi

# Clone the repository
echo "Cloning macos-setup repository."
if [[ -d ${HOME}/macos-setup ]]; then
    rm -rf ${HOME}/macos-setup
fi
git clone https://github.com/daniel-mizsak/macos-setup.git ${HOME}/macos-setup --quiet

# Create python virtual environment and install ansible
echo "Creating python virtual environment and installing ansible."
if [[ ! -d ${HOME}/macos-setup/.venv ]]; then
    python3 -m venv --upgrade-deps ${HOME}/macos-setup/.venv > /dev/null
fi
source ${HOME}/macos-setup/.venv/bin/activate
pip3 install -r ${HOME}/macos-setup/ansible/requirements.txt -qqq

# Check if script is running on a virtual machine
if system_profiler SPHardwareDataType | grep -q 'Model Identifier: .*Virtual';then
    SKIP_TAGS="--skip-tags ignore-vm"
    echo "Script is running on a virtual machine. Skipping tasks that are not needed."
else
    SKIP_TAGS=""
    echo "Script is not running on a virtual machine."
fi


# Running setup scripts
tasks_to_run=("homebrew" "package" "startup" "system" "finder" "dock" "dockutil" "dotfile")

for task in "${tasks_to_run[@]}"
do
    echo "Running ${task} setup."

    ansible-playbook \
    ${HOME}/macos-setup/ansible/playbook.yml \
    --extra-vars "task_name=${task}" \
    ${SKIP_TAGS} \

    if [ "$task" == "homebrew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
done

# Restart finder and dock
echo "Restarting Finder and Dock."
killall Finder
killall Dock
