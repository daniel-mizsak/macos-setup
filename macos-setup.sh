#!/bin/bash

# Create python virtual environment and install ansible
python3 -m venv .venv
source .venv/bin/activate
cd ansible
pip install -r requirements.txt

# Run the playbook
ansible-playbook playbook.yml
