#!/bin/bash

set -e # exit if a command fails

curl -fsSL https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/scripts/prepare-environment.sh -o /tmp/prepare-environment.sh
source /tmp/prepare-environment.sh

tasks="terminal"
source ${HOME}/macos-setup/scripts/run-tasks.sh $tasks
