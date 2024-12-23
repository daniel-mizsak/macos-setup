$ErrorActionPreference = "Stop"  # exit if a command fails

# Prepare environment
Write-Output "Making sure the macos-setup repository is present."
if (-Not (Test-Path -Path "$HOME\macos-setup")) {
    git clone https://github.com/daniel-mizsak/macos-setup.git "$HOME\macos-setup" --quiet
}

Write-Output "Making sure the python virtual environment and dependencies are present."
if (-Not (Test-Path -Path "$HOME\macos-setup\.venv")) {
    python -m venv --upgrade-deps "$HOME\macos-setup\.venv" > $null
}

# Activate virtual environment and install dependencies
& "$HOME\macos-setup\.venv\Scripts\Activate.ps1"
pip install -r "$HOME\macos-setup\ansible\requirements.txt" -q
$env:ANSIBLE_PYTHON_INTERPRETER = "$HOME\macos-setup\.venv\Scripts\python.exe"

# Run tasks
$tasks = @("programs", "system", "terminal")
foreach ($task in $tasks) {
    # Run the ansible playbook for each task
    Write-Output "Running $task setup."
    ansible-playbook `
        "$HOME\macos-setup\ansible\playbook.yml" `
        --extra-vars "task_name=windows\$task"
}
