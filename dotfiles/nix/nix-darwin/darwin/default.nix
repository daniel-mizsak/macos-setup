{
  nixpkgs,
  home-manager,
  darwin,
  nix-homebrew,
  vars,
}:

{
  Mizsak-D-MBM = darwin.lib.darwinSystem {
    system = vars.system;
    pkgs = nixpkgs {
      hostPlatform = vars.system;
      config.allowUnfree = true;
    };

    specialArgs = {
      inherit vars;
    };

    modules = [
      nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = vars.user;
          mutableTaps = false;
        };
      }

      ./darwin-configuration.nix

      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${vars.user} = import ./home.nix;
        };
      }
    ];
  };
}
