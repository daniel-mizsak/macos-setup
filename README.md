## <div align="center"> 🍎 macos-setup</div>

<div align="center">
<a href="https://github.com/daniel-mizsak/macos-setup/actions/workflows/main.yml" target="_blank"><img src="https://github.com/daniel-mizsak/macos-setup/actions/workflows/main.yml/badge.svg" alt="build status"></a>
<a href="https://results.pre-commit.ci/latest/github/daniel-mizsak/macos-setup/main" target="_blank"><img src="https://results.pre-commit.ci/badge/github/daniel-mizsak/macos-setup/main.svg" alt="pre-commit.ci status"></a>
<a href="https://img.shields.io/github/license/daniel-mizsak/macos-setup" target="_blank"><img src="https://img.shields.io/github/license/daniel-mizsak/macos-setup" alt="license"></a>
</div>

## Overview
Setting up and making sure that macOS is configured properly and is ready for development.

## Getting started
First make sure that you are logged in with your Apple ID, so applications can be downloaded from the **App Store**.\
The setup should execute automatically after running the following command in the terminal and entering the password:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/daniel-mizsak/macos-setup/HEAD/macos-setup.sh)"
```


After the first run, it is recommended to **restart** the computer and **run the script again** to make sure that everything is installed properly.
If everything were setup properly no changes should be present.


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
