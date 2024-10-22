{
  inputs,
  nixpkgs,
  home-manager,
  darwin,
  nix-homebrew,
  vars,
}:

{
  Mizsak-D-MBM = darwin.lib.darwinSystem {
    system = "aarch64-darwin";
    modules = [
      nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = vars.user;
        };
      }

      # TODO: Add variable inheritance
      ./darwin-configuration.nix

      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${vars.user} = {
            imports = [ ./home.nix ];
          };
        };
      }
    ];
  };
}
