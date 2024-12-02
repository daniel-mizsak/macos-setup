# https://github.com/zmre/mac-nix-simple-example
# https://github.com/omerxx/dotfiles
# https://github.com/dreamsofautonomy/nix-darwin
# https://github.com/MatthiasBenaets/nix-config/blob/master/darwin.org

{
  description = "Setting up everything with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nix-darwin, nix-homebrew }:
    let
      mkSystem = import ./mksystem.nix {
        inherit nixpkgs inputs;
      };
    in
    {
      darwinConfigurations.macbook = mkSystem "macbook" {
        system = "aarch64-darwin";
        user = "damz";
        is-darwin = true;
      };

      nixosConfigurations.vm-aarch64 = mkSystem "vm-aarch64" {
        system = "aarch64-linux";
        user = "damz";
      };

      nixosConfigurations.vm-x86_64 = mkSystem "vm-x86_64" {
        system = "x86_64-linux";
        user = "damz";
      };
    };
}
