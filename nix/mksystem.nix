# https://github.com/mitchellh/nixos-config/blob/main/lib/mksystem.nix
# https://discourse.nixos.org/t/optimize-flake-nix-code/29687


# This function creates a NixOS system based on our VM setup for a
# particular architecture.
{ nixpkgs, inputs }:

name:
{ system
, user
, is-darwin ? false
}:

let
  # The config files for this system.
  machineConfig = ./machines/${name}.nix;
  nixConfig = ./${if is-darwin then "nix-darwin" else "nixos"}.nix;

  # NixOS vs nix-darwin functions
  systemFunc = if is-darwin then inputs.nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
  home-manager = if is-darwin then inputs.home-manager.darwinModules else inputs.home-manager.nixosModules;
in
systemFunc rec {
  inherit system;

  modules = [
    # Allow unfree packages.
    { nixpkgs.config.allowUnfree = true; }

    inputs.nix-homebrew.darwinModules.nix-homebrew
    (if is-darwin then import ./modules/nix-homebrew.nix { inherit user; } else { })

    machineConfig
    nixConfig

    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import ./modules/home-manager.nix {
        inherit user inputs;
      };
    }

    # We expose some extra arguments so that our modules can parameterize
    # better based on these values.
    {
      config._module.args = {
        currentSystem = system;
        currentSystemName = name;
        currentSystemUser = user;
        inputs = inputs;
      };
    }

  ];
}

