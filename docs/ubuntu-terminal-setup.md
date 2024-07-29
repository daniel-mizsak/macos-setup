## Configure terminal in WSL

In a **Ubuntu** environment first install `python3-venv`:

```bash
sudo apt update && sudo apt install python3-venv -y
```


Install **Homebrew**:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Add **Homebrew** to your `PATH`:
```bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | tee -a ${HOME}/.zshenv ${HOME}/.bashenv
```
```bash
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

Run the **terminal setup** script:
```bash
/bin/bash -c "$(curl -fsSL \
https://raw.githubusercontent.com/daniel-mizsak/macos-setup/HEAD/scripts/terminal-setup.sh)"
```

Change the **default shell** to `zsh`:
```bash
echo $(command -v zsh) >> /etc/shells
```
```bash
chsh -s "$(command -v zsh)" "${USER}"
```

Install **TMUX** plugins:
