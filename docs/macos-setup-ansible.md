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

Sign in to `Apple Account`.

Run the **macos setup** script:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/daniel-mizsak/macos-setup/main/ansible/scripts/macos-setup-ansible.sh)"
```

Install **TMUX** plugins:
```bash
tmux
prefix -> I
```

Where prefix for me is `Ctrl + f`.


Apply manual settings detailed [here](macos-manual-settings.md).