## <div align="center"> 🍎 macos-setup</div>

<div align="center">
<a href="https://img.shields.io/github/license/daniel-mizsak/macos-setup" target="_blank"><img src="https://img.shields.io/github/license/daniel-mizsak/macos-setup" alt="license"></a>
</div>

## Overview
Setting up and making sure that macOS is configured properly and is ready for development.

## Getting started
To use ansible on the target host, the following steps are required to be executed manually:

Install xcode command line tools:
```bash
xcode-select --install
```

Install homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshenv
```
Brew needs to be added to `~/.zshenv` as [that is the file getting sourced](https://stackoverflow.com/questions/32306653/zshrc-is-not-loaded-in-ansible) for non-interactive shells as well (e.g. ansible).


Clone the repository:
```bash
git clone https://github.com/daniel-mizsak/macos-setup.git
cd macos-setup
```

Run the setup script:
```bash
./macos-setup.sh
```

[Install and customize Oh My Zsh](https://gist.github.com/kevin-smets/8568070)

