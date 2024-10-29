# https://github.com/zmre/mac-nix-simple-example
# https://github.com/omerxx/dotfiles
# https://github.com/dreamsofautonomy/nix-darwin
# https://github.com/MatthiasBenaets/nix-config/blob/master/darwin.org

{
  description = "MacOS setup with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      darwin,
      nix-homebrew,
    }:
    let
      vars = {
        system = "aarch64-darwin";
        user = "damz";
      };
      pkgs = import nixpkgs {
        system = vars.system;
        hostPlatform = vars.system;
        config.allowUnfree = true;
      };

      configuration =
        { pkgs, ... }:

        {
          nix = {
            configureBuildUsers = true;
            settings.experimental-features = "nix-command flakes";
            useDaemon = true;
          };
          services.nix-daemon.enable = true;

          programs.zsh.enable = true;
          users.users.${vars.user}.home = "/Users/${vars.user}";
        };
    in
    {
      darwinConfigurations.Mizsak-D-MBM = darwin.lib.darwinSystem {
        system = vars.system;

        specialArgs = {
          inherit vars pkgs;
        };

        modules = [
          configuration

          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = vars.user;
            };
          }

          ./modules/darwin-system.nix
          ./modules/programs.nix

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${vars.user} = import ./modules/home.nix { inherit vars pkgs; };
            };
          }
        ];
      };
      darwinPackages = self.darwinConfigurations.Mizsak-D-MBM.pkgs;
    };
}
