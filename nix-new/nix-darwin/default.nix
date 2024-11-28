{ nixpkgs, home-manager, nix-darwin, nix-homebrew }:

{
  nix-darwin = nix-darwin.lib.darwinSystem {
    system = "aarch64-darwin";
  }
}