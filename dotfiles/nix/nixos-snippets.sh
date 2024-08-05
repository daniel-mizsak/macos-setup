# Disko:
# https://github.com/nix-community/disko
spc ./disk-config.nix nixos<IP>:/tmp/disk-config.nix
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disk-config.nix

# Nixos installation:
# https://nixos.wiki/wiki/NixOS_Installation_Guide
sudo nixos-generate-config --root /mnt
scp ./configuration.nix nixos<IP>:/mnt/etc/nixos/configuration.nix
sudo nixos-install

# Nixos rebuild:
sudo nixos-rebuild switch

# List and delete old generations:
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
sudo nix-collect-garbage --delete-older-than 2d
