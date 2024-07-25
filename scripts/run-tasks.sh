#!/bin/bash

set -e # exit if a command fails

if [ "$#" -eq 0 ]; then
    echo "No tasks provided. Please provide at least one task to run."
    exit 1
fi

ALLOWED_TASKS=("dock" "dockutil" "dotfile" "finder" "package" "startup" "system" "terminal")
is_task_allowed() {
    local task=$1
    for allowed_task in "${ALLOWED_TASKS[@]}"; do
        if [ "$allowed_task" == "$task" ];  then
            return 0
        fi
    done
    return 1
}

for task in "$@"
do
    if ! is_task_allowed "$task"; then
        echo "Task '${task}' is not allowed. Allowed tasks are: ${ALLOWED_TASKS[*]}"
        exit 1
    fi

    echo "Running ${task} setup."

    ansible-playbook \
    ${HOME}/macos-setup/ansible/playbook.yml \
    --inventory ${HOME}/macos-setup/ansible/inventory.ini \
    --extra-vars "task_name=${task}" \
    ${SKIP_TAGS}
done
