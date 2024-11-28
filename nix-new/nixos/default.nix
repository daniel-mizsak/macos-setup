{ nixpkgs, ... }:

{
  nixos-x86-vm =
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit pkgs;
      };

      modules = [
        ./configuration.nix
        ../home-manager/packages.nix
      ];
    };

  nixos-arm-vm =
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit pkgs;
      };

      modules = [
        ./configuration.nix
        ../home-manager/packages.nix
      ];
    };
}
