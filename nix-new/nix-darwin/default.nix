{ nixpkgs, home-manager, nix-darwin, nix-homebrew, ... }:

let
  system = "aarch64-darwin";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  nix-darwin-arm = nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = {
      inherit pkgs;
    };

    modules = [
      ./configuration.nix

      nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = "damz";
        };
      }

      ./modules/darwin-system.nix
      ./modules/programs.nix


    ]

      };
  }
