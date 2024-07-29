## Configure macOS

In a **macOS** environment first install `xcode-select`.
```bash
xcode-select --install
```

Install `Homebrew`:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add `Homebrew` to your `PATH`:
```bash
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ${HOME}/.zshenv
```
```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Before running the **macos setup** script, make sure you are logged in to the **App Store**.\
Run the **macos setup** script:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/scripts/macos-setup.sh)"
```

Install **TMUX** plugins:
```bash
tmux
prefix -> I
```

Where prefix for me is `Ctrl + f`.


Apply manual settings detailed [here](macos-manual-settings.md).
