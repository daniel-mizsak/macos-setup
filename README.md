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
