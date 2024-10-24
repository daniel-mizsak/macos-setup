{
  nixpkgs,
  home-manager,
  darwin,
  nix-homebrew,
  vars,
}:
let
  pkgs = import nixpkgs {
    system = vars.system;
    config.allowUnfree = true;
  };
in
{
  Mizsak-D-MBM = darwin.lib.darwinSystem {
    system = vars.system;

    specialArgs = {
      inherit pkgs vars;
    };

    modules = [
      nix-homebrew.darwinModules.nix-homebrew
      {
        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = vars.user;
        };
      }

      ./darwin-configuration.nix

      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${vars.user} = import ./home.nix { inherit pkgs vars; };
        };
      }
    ];
  };
}
