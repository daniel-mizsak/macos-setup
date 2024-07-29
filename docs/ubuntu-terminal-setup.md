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
(echo; echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | tee -a ${HOME}/.zshenv ${HOME}/.bashrc)
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
command -v zsh | sudo tee -a /etc/shells
```
```bash
sudo chsh -s "$(command -v zsh)" "${USER}"
```

Install **TMUX** plugins:

```bash
tmux
prefix -> I
```

Where prefix for me is `Ctrl + f`.
