#!/bin/bash

set -e # exit if a command fails

# Prepare environment
echo "Making sure the macos-setup repository is present."
if [[ ! -d ${HOME}/macos-setup ]]; then
    git clone https://github.com/daniel-mizsak/macos-setup.git ${HOME}/macos-setup --quiet
fi

echo "Making sure the python virtual environment and dependencies are present."
if [[ ! -d ${HOME}/macos-setup/.venv ]]; then
    python3 -m venv --upgrade-deps ${HOME}/macos-setup/.venv > /dev/null
fi

# Activate virtual environment and install dependencies
source ${HOME}/macos-setup/.venv/bin/activate
pip3 install -r ${HOME}/macos-setup/ansible/requirements.txt -qqq
export ANSIBLE_PYTHON_INTERPRETER=${HOME}/macos-setup/.venv/bin/python


# Run the ansible playbook for terminal task
echo "Running terminal setup."
ansible-playbook \
    ${HOME}/macos-setup/ansible/playbook.yml \
    --extra-vars "task_name=terminal"
