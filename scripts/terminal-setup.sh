#!/bin/bash

set -e # exit if a command fails

source ./prepare-environment.sh

tasks="terminal"
source ./run-tasks.sh $tasks
