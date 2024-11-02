#!/bin/bash

set -e # exit if a command fails

if [ "$#" -eq 0 ]; then
    echo "No tasks provided. Please provide at least one task to run."
    exit 1
fi

for task in "$@"
do
    echo "Running ${task} setup."

    ansible-playbook \
    ${HOME}/macos-setup/ansible/playbook.yml \
    --extra-vars "task_name=${task}"
done
