## Configure macOS

In a **macOS** environment first install `xcode-select`:
```bash
xcode-select --install
```

Sign in to Apple Account.

Change local hostname to `Mizsak-D-MBM`.

Install `Nix`:
```bash
sh <(curl -L https://nixos.org/nix/install)
```

Enable Nix Flakes in `~/.config/nix/nix.conf`:
```bash
mkdir -p ~/.config/nix
cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
EOF
```

Enable full disk access for `Terminal` in `System Preferences > Privacy & Security > Full Disk Access`.

Clone repository:
```bash
git clone https://github.com/daniel-mizsak/macos-setup.git
```

Run [`nix-darwin`](https://github.com/LnL7/nix-darwin):
```bash
nix run nix-darwin -- switch --impure --flake ~/macos-setup/dotfiles/nix/nix-darwin
```
