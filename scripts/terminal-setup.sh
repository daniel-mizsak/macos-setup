#!/bin/bash

set -e # exit if a command fails

source <(curl -s https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/scripts/prepare-environment.sh)

tasks="terminal"
source ${HOME}/macos-setup/scripts/run-tasks.sh $tasks
