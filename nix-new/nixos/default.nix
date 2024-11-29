{ nixpkgs, ... }:

let
  mkSystem = { system, extraModules ? [] }:
    let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    nixpkgs.lib.nixosSystem {
      system = system;
      inherit pkgs;

      specialArgs = {
        inherit pkgs;
      };

      modules = [
        ./configuration.nix
        ../home-manager/packages.nix
      ] ++ extraModules;
    };

in {
  nixos-x86-vm = mkSystem { system = "x86_64-linux"; };
  nixos-arm-vm = mkSystem { system = "aarch64-linux"; };
}