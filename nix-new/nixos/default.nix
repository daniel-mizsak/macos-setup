{ nixpkgs, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  nixos-x86 = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit pkgs;
    };

    modules = [
      ./configuration.nix
      ../modules/packages.nix
    ];
  };

  nixos-aarch64 = nixpkgs.lib.nixosSystem {
  };
}