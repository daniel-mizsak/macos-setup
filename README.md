## <div align="center"> 🍎 macos-setup</div>

<div align="center">
<a href="https://github.com/daniel-mizsak/macos-setup/actions/workflows/ci.yml" target="_blank"><img src="https://github.com/daniel-mizsak/macos-setup/actions/workflows/ci.yml/badge.svg" alt="build status"></a>
<a href="https://results.pre-commit.ci/latest/github/daniel-mizsak/macos-setup/main" target="_blank"><img src="https://results.pre-commit.ci/badge/github/daniel-mizsak/macos-setup/main.svg" alt="pre-commit.ci status"></a>
<a href="https://img.shields.io/github/license/daniel-mizsak/macos-setup" target="_blank"><img src="https://img.shields.io/github/license/daniel-mizsak/macos-setup" alt="license"></a>
</div>

## Overview
Setting up and making sure that macOS is configured properly and is ready for development.

## Getting started
First let's install `xcode-select` and `Homebrew`.

Install `xcode-select`:
```bash
xcode-select --install
```

Install `Homebrew`:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/daniel-mizsak/macos-setup/HEAD/macos-setup.sh)"
```


## Manual settings:
Finder:
- Disable `Tags` in Finder
- Remove `Recents` from Finder
- Set `Finder` Favourites order to: `AirDrop`, `Applications`, `Downloads`, `Documents`, `SynologyDrive`, `Home`

Apps:
- `Parallels Desktop`
- `Boosteroid`

Raycast:
- Unbind CMD + Space from `Spotlight`
- Bind CMD + Space to `Raycast`
- Install extensions

iTerm2:
- Enable world jumping in `iTerm2`: `iTerm2` -> `Preferences` -> `Profiles` -> `Keys` -> `Key Mappings` -> `Presets...` -> `Natural Text Editing`


## Chocolatey
Chocolatey is a package manager for Windows. Install chocolatey from [chocolatey.org](https://chocolatey.org/install).\
Use the following PowerShell command to install the software listed in the `choco.ps1` file.

```powershell
Invoke-Expression (Invoke-WebRequest -Uri `
https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/dotfiles/choco/choco.ps1 -UseBasicParsing).Content
```
