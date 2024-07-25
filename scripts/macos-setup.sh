#!/bin/bash

set -e # exit if a command fails

# Call the prepare-environment.sh script
source ./prepare-environment.sh

# Check if script is running on a virtual machine
if system_profiler SPHardwareDataType | grep -q 'Model Identifier: .*Virtual';then
    SKIP_TAGS="--skip-tags ignore-vm"
    echo "Script is running on a virtual machine. Skipping tasks that are not needed."
else
    SKIP_TAGS=""
    echo "Script is not running on a virtual machine."
fi

# Running setup scripts
tasks_to_run=("package" "startup" "system" "finder" "dock" "dockutil" "dotfile")

for task in "${tasks_to_run[@]}"
do
    echo "Running ${task} setup."

    ansible-playbook \
    ${HOME}/macos-setup/ansible/playbook.yml \
    --inventory ${HOME}/macos-setup/ansible/inventory.ini \
    --extra-vars "task_name=${task}" \
    ${SKIP_TAGS}
done

# Restart finder and dock
echo "Restarting Finder and Dock."
killall Finder
killall Dock
