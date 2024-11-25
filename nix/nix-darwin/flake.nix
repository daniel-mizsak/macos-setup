# https://github.com/zmre/mac-nix-simple-example
# https://github.com/omerxx/dotfiles
# https://github.com/dreamsofautonomy/nix-darwin
# https://github.com/MatthiasBenaets/nix-config/blob/master/darwin.org

{
  description = "MacOS setup with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{ self, nixpkgs, home-manager, darwin, nix-homebrew }:
    let
      pkgs = import nixpkgs {
        system = "aarch64-darwin";
      };
      user = "damz";

      configuration =
        { pkgs, ... }:

        {
          nix = {
            configureBuildUsers = true;
            gc.automatic = true;
            optimise.automatic = true;
            settings.experimental-features = "nix-command flakes";
            useDaemon = true;
          };
          services.nix-daemon.enable = true;

          users.users.${user} = {
            name = user;
            home = "/Users/${user}";
          };
        };
    in
    {
      darwinConfigurations.Mizsak-D-MBM = darwin.lib.darwinSystem {
        system = "aarch64-darwin";

        specialArgs = {
          inherit pkgs user;
        };

        modules = [
          configuration

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = user;
            };
          }

          ./modules/darwin-system.nix
          ./modules/programs.nix

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${user}.imports = [
                ({ config, ... }: import ./modules/home.nix { inherit config pkgs user; })
              ];
            };
          }
        ];
      };
    };
}
