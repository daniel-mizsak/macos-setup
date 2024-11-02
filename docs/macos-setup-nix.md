## Configure macOS using Nix-Darwin

In a **macOS** environment first install `xcode-select`:
```bash
xcode-select --install
```

Install **Nix**:
```bash
sh <(curl -L https://nixos.org/nix/install)
```

Enable **Nix Flakes** in `~/.config/nix/nix.conf`:
```bash
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```

Change local **hostname** to `Mizsak-D-MBM`.

Sign in to **Apple Account**.

Enable full disk access for **Terminal** in `System Preferences > Privacy & Security > Full Disk Access`.

**Clone** repository:
```bash
git clone https://github.com/daniel-mizsak/macos-setup.git
```

Run [`nix-darwin`](https://github.com/LnL7/nix-darwin):
```bash
nix run nix-darwin -- switch --impure --flake ~/macos-setup/nix/nix-darwin
```

Install **TMUX** plugins:
```bash
tmux
prefix -> I
```

Where prefix for me is `Ctrl + f`.

Apply manual settings detailed [here](macos-manual-settings.md).

## Additional information:

After the first run, switches can be done with:
```bash
darwin-rebuild switch --impure --flake ~/macos-setup/nix/nix-darwin
```

To update the system:
```bash
nix-channel --update darwin
```

List Nix generations:
```bash
nix-env --list-generations
```

Rollback to a specific previous generation:
```bash
darwin-rebuild switch --impure --flake ~/macos-setup/nix/nix-darwin --rollback
```

Delete old generations (you may also want to run the command with `sudo`):
```bash
nix-collect-garbage -d
```
